(*
   Copyright 2008-2014 Nikhil Swamy and Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)
#light "off"

module FStar.TypeChecker.Recheck

open FStar
open FStar.Syntax
open FStar.Syntax.Syntax
open FStar.Syntax.Util
open FStar.Util
open FStar.Range
open FStar.Ident
open FStar.Const
open FStar.TypeChecker.Env

module U = FStar.Syntax.Util
module S = FStar.Syntax.Syntax
module SS = FStar.Syntax.Subst
module C = FStar.Syntax.Const

let tconst l = mk (Tm_fvar(fv (set_lid_range l Range.dummyRange) None)) (Some Util.ktype0.n) Range.dummyRange
let t_unit   = tconst C.unit_lid
let t_bool   = tconst C.bool_lid 
let t_uint8  = tconst C.uint8_lid 
let t_int    = tconst C.int_lid   
let t_int32  = tconst C.int32_lid 
let t_int64  = tconst C.int64_lid 
let t_string = tconst C.string_lid
let t_float  = tconst C.float_lid 
let t_char   = tconst C.char_lid  

let norm t = Normalize.normalize [Normalize.Beta] Env.dummy t

let typing_const r (s:sconst) = match s with
  | Const_unit -> t_unit
  | Const_bool _ -> t_bool
  | Const_int _ -> t_int
  | Const_int32 _ -> t_int32
  | Const_int64 _ -> t_int64
  | Const_string _ -> t_string
  | Const_float _ -> t_float
  | Const_char _ -> t_char
  | Const_uint8 _ -> t_uint8
  | Const_effect -> Util.ktype0 //NS: really?
  | _ -> raise (Error("Unsupported constant", r))

////this is only supposed return a type that faithfully captures the arity of the term
//let rec universe_of_type env t = match t.n with
//        | Tm_delayed _    -> universe_of env (SS.compress t)
//        
//        | Tm_name a       -> U_zero
//        | Tm_fvar (fv, _) -> U_zero
//        | Tm_uinst(t, us) -> U_zero
//
//        | Tm_type u       -> U_succ u
//        | Tm_arrow(bs, c) -> 
//          U_max (universe_of env (Util.comp_result c) :: List.map (fun (b, _) -> universe_of env b.sort) bs)
//                      
//        | Tm_refine(x, _)       -> universe_of env x.sort
//        | Tm_ascribed (x, _, _) -> universe_of env x
//
//        | Tm_uvar(_, k)  -> universe_of env k
//        | Tm_meta(t, _)  -> universe_of env t
//
//        | Tm_abs(binders, body) -> U_zero
//
//        | Tm_app(head, args) -> failwith ""
//
//        | Tm_let(_, e) -> universe_of env e
//
//        | Tm_match _ -> failwith "Expect match nodes to be ascribed"
//        | Tm_unknown -> failwith "Unknown term in universe computation" in
//
//and universe_of_term env t = match (SS.compress t).n with
//    | Tm_constant s   -> U_zero
//    | Tm_name a       -> U_zero
//    | Tm_fvar (fv, _) -> U_zero
//    
//        
//
//    match !t.tk with
//        | Some k -> mk k None t.pos
//        | None -> let k = recompute t in t.tk := Some k.n; k


//this is only supposed return a type that faithfully captures the arity of the term
let rec check t =
    let recompute t = match t.n with
        | Tm_delayed _ -> check (SS.compress t)
        | Tm_bvar a
        | Tm_name a -> a.sort
        | Tm_fvar (fv, _) -> fv.sort
        | Tm_uinst(t, us) -> check t //inaccurate
        | Tm_type u -> mk (Tm_type (U_succ u)) None t.pos
        | Tm_constant s -> typing_const t.pos s
        | Tm_arrow _  -> ktype0 //??
        | Tm_refine _ -> ktype0 
        | Tm_ascribed (_, k, _) 
        | Tm_uvar(_, k) -> k
        | Tm_meta(t, _) -> check t
        | Tm_abs(binders, body) -> arrow binders (mk_Total (check body)) //total?
        | Tm_app(head, args) ->
          begin match head.n with
            | Tm_fvar (tc, _) when (lid_equals tc.v C.forall_lid
                                || lid_equals tc.v C.exists_lid
                                || lid_equals tc.v C.allTyp_lid
                                || lid_equals tc.v C.exTyp_lid) -> ktype0
            | _ ->
              let x = mk in
              let t1 = check head |> norm in
              let bs, c = U.arrow_formals t1 in
              let n_args = List.length args in
              let bs, rest = 
                if n_args <= List.length bs
                then Util.first_N (List.length args) bs 
                else failwith (Util.format2 "Rechecking %s\n head type is %s\n" (Print.term_to_string t) (Print.term_to_string t1)) in
              let res_typ = match rest with 
                | [] -> c 
                | _ -> S.mk (Tm_arrow(rest, mk_Total c)) None c.pos in
              SS.subst_binders bs args res_typ
          end   
        | Tm_let(_, e) -> check e
        | Tm_match _ -> failwith "Expect match nodes to be annotated already"
        | Tm_unknown -> t in
    match !t.tk with
        | Some k -> mk k None t.pos
        | None -> let k = recompute t in t.tk := Some k.n; k
