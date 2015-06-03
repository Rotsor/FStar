
let syn' = (fun env k -> (Microsoft_FStar_Absyn_Syntax.syn (Microsoft_FStar_Tc_Env.get_range env) (Some (k))))

let log = (fun env -> ((Support.ST.read Microsoft_FStar_Options.log_types) && (not ((Microsoft_FStar_Absyn_Syntax.lid_equals Microsoft_FStar_Absyn_Const.prims_lid (Microsoft_FStar_Tc_Env.current_module env))))))

let rng = (fun env -> (Microsoft_FStar_Tc_Env.get_range env))

let instantiate_both = (fun env -> (let _338624 = env
in {Microsoft_FStar_Tc_Env.solver = _338624.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _338624.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _338624.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _338624.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _338624.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _338624.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _338624.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _338624.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _338624.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = true; Microsoft_FStar_Tc_Env.instantiate_vargs = true; Microsoft_FStar_Tc_Env.effects = _338624.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _338624.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _338624.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _338624.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _338624.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = _338624.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = _338624.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _338624.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _338624.Microsoft_FStar_Tc_Env.default_effects}))

let no_inst = (fun env -> (let _338627 = env
in {Microsoft_FStar_Tc_Env.solver = _338627.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _338627.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _338627.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _338627.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _338627.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _338627.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _338627.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _338627.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _338627.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = false; Microsoft_FStar_Tc_Env.instantiate_vargs = false; Microsoft_FStar_Tc_Env.effects = _338627.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _338627.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _338627.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _338627.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _338627.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = _338627.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = _338627.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _338627.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _338627.Microsoft_FStar_Tc_Env.default_effects}))

let mk_lex_list = (fun vs -> (Support.List.fold_right (fun v tl -> (let r = if (tl.Microsoft_FStar_Absyn_Syntax.pos = Microsoft_FStar_Absyn_Syntax.dummyRange) then begin
v.Microsoft_FStar_Absyn_Syntax.pos
end else begin
(Support.Microsoft.FStar.Range.union_ranges v.Microsoft_FStar_Absyn_Syntax.pos tl.Microsoft_FStar_Absyn_Syntax.pos)
end
in (Microsoft_FStar_Absyn_Syntax.mk_Exp_app (Microsoft_FStar_Absyn_Util.lex_pair, (((Support.Microsoft.FStar.Util.Inl (Microsoft_FStar_Tc_Recheck.recompute_typ v)), Some (Microsoft_FStar_Absyn_Syntax.Implicit)))::((Microsoft_FStar_Absyn_Syntax.varg v))::((Microsoft_FStar_Absyn_Syntax.varg tl))::[]) (Some (Microsoft_FStar_Absyn_Util.lex_t)) r))) vs Microsoft_FStar_Absyn_Util.lex_top))

let is_eq = (fun _338600 -> (match (_338600) with
| Some (Microsoft_FStar_Absyn_Syntax.Equality) -> begin
true
end
| _ -> begin
false
end))

let steps = (fun env -> if (Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str) then begin
(Microsoft_FStar_Tc_Normalize.Beta)::(Microsoft_FStar_Tc_Normalize.SNComp)::[]
end else begin
(Microsoft_FStar_Tc_Normalize.Beta)::[]
end)

let whnf = (fun env t -> (Microsoft_FStar_Tc_Normalize.norm_typ ((Microsoft_FStar_Tc_Normalize.WHNF)::(Microsoft_FStar_Tc_Normalize.DeltaHard)::(Microsoft_FStar_Tc_Normalize.Beta)::[]) env t))

let norm_t = (fun env t -> (Microsoft_FStar_Tc_Normalize.norm_typ (steps env) env t))

let norm_k = (fun env k -> (Microsoft_FStar_Tc_Normalize.norm_kind (steps env) env k))

let norm_c = (fun env c -> (Microsoft_FStar_Tc_Normalize.norm_comp (steps env) env c))

let fxv_check = (fun head env kt fvs -> (let rec aux = (fun norm kt -> if (Support.Microsoft.FStar.Util.set_is_empty fvs) then begin
()
end else begin
(let fvs' = (match (kt) with
| Support.Microsoft.FStar.Util.Inl (k) -> begin
(Microsoft_FStar_Absyn_Util.freevars_kind (if norm then begin
(norm_k env k)
end else begin
k
end))
end
| Support.Microsoft.FStar.Util.Inr (t) -> begin
(Microsoft_FStar_Absyn_Util.freevars_typ (if norm then begin
(norm_t env t)
end else begin
t
end))
end)
in (let a = (Support.Microsoft.FStar.Util.set_intersect fvs fvs'.Microsoft_FStar_Absyn_Syntax.fxvs)
in if (Support.Microsoft.FStar.Util.set_is_empty a) then begin
()
end else begin
if (not (norm)) then begin
(aux true kt)
end else begin
(let fail = (fun _338661 -> (match (_338661) with
| () -> begin
(let escaping = ((Support.String.concat ", ") ((Support.List.map (fun x -> (Microsoft_FStar_Absyn_Print.strBvd x.Microsoft_FStar_Absyn_Syntax.v))) (Support.Microsoft.FStar.Util.set_elements a)))
in (let msg = if ((Support.Microsoft.FStar.Util.set_count a) > 1) then begin
(Support.Microsoft.FStar.Util.format2 "Bound variables \'\x7b%s\x7d\' in the type of \'%s\' escape because of impure applications; add explicit let-bindings" escaping (Microsoft_FStar_Tc_Normalize.exp_norm_to_string env head))
end else begin
(Support.Microsoft.FStar.Util.format2 "Bound variable \'%s\' in the type of \'%s\' escapes because of impure applications; add explicit let-bindings" escaping (Microsoft_FStar_Tc_Normalize.exp_norm_to_string env head))
end
in (raise (Microsoft_FStar_Absyn_Syntax.Error ((msg, (Microsoft_FStar_Tc_Env.get_range env)))))))
end))
in (match (kt) with
| Support.Microsoft.FStar.Util.Inl (k) -> begin
(let s = (Microsoft_FStar_Tc_Util.new_kvar env)
in (match ((Microsoft_FStar_Tc_Rel.try_keq env k s)) with
| Some (g) -> begin
(Microsoft_FStar_Tc_Rel.try_discharge_guard env g)
end
| _ -> begin
(fail ())
end))
end
| Support.Microsoft.FStar.Util.Inr (t) -> begin
(let s = (Microsoft_FStar_Tc_Util.new_tvar env Microsoft_FStar_Absyn_Syntax.ktype)
in (match ((Microsoft_FStar_Tc_Rel.try_teq env t s)) with
| Some (g) -> begin
(Microsoft_FStar_Tc_Rel.try_discharge_guard env g)
end
| _ -> begin
(fail ())
end))
end))
end
end))
end)
in (aux false kt)))

let maybe_push_binding = (fun env b -> if (Microsoft_FStar_Absyn_Syntax.is_null_binder b) then begin
env
end else begin
(match ((Support.Prims.fst b)) with
| Support.Microsoft.FStar.Util.Inl (a) -> begin
(let b = Microsoft_FStar_Tc_Env.Binding_typ ((a.Microsoft_FStar_Absyn_Syntax.v, a.Microsoft_FStar_Absyn_Syntax.sort))
in (Microsoft_FStar_Tc_Env.push_local_binding env b))
end
| Support.Microsoft.FStar.Util.Inr (x) -> begin
(let b = Microsoft_FStar_Tc_Env.Binding_var ((x.Microsoft_FStar_Absyn_Syntax.v, x.Microsoft_FStar_Absyn_Syntax.sort))
in (Microsoft_FStar_Tc_Env.push_local_binding env b))
end)
end)

let maybe_make_subst = (fun _338601 -> (match (_338601) with
| Support.Microsoft.FStar.Util.Inl ((Some (a), t)) -> begin
(Support.Microsoft.FStar.Util.Inl ((a, t)))::[]
end
| Support.Microsoft.FStar.Util.Inr ((Some (x), e)) -> begin
(Support.Microsoft.FStar.Util.Inr ((x, e)))::[]
end
| _ -> begin
[]
end))

let maybe_alpha_subst = (fun s b1 b2 -> if (Microsoft_FStar_Absyn_Syntax.is_null_binder b1) then begin
s
end else begin
(match (((Support.Prims.fst b1), (Support.Prims.fst b2))) with
| (Support.Microsoft.FStar.Util.Inl (a), Support.Microsoft.FStar.Util.Inl (b)) -> begin
if (Microsoft_FStar_Absyn_Util.bvar_eq a b) then begin
s
end else begin
(Support.Microsoft.FStar.Util.Inl ((a.Microsoft_FStar_Absyn_Syntax.v, (Microsoft_FStar_Absyn_Util.btvar_to_typ b))))::s
end
end
| (Support.Microsoft.FStar.Util.Inr (x), Support.Microsoft.FStar.Util.Inr (y)) -> begin
if (Microsoft_FStar_Absyn_Util.bvar_eq x y) then begin
s
end else begin
(Support.Microsoft.FStar.Util.Inr ((x.Microsoft_FStar_Absyn_Syntax.v, (Microsoft_FStar_Absyn_Util.bvar_to_exp y))))::s
end
end
| _ -> begin
(failwith ("impossible"))
end)
end)

let maybe_extend_subst = (fun s b v -> if (Microsoft_FStar_Absyn_Syntax.is_null_binder b) then begin
s
end else begin
(match (((Support.Prims.fst b), (Support.Prims.fst v))) with
| (Support.Microsoft.FStar.Util.Inl (a), Support.Microsoft.FStar.Util.Inl (t)) -> begin
(Support.Microsoft.FStar.Util.Inl ((a.Microsoft_FStar_Absyn_Syntax.v, t)))::s
end
| (Support.Microsoft.FStar.Util.Inr (x), Support.Microsoft.FStar.Util.Inr (e)) -> begin
(Support.Microsoft.FStar.Util.Inr ((x.Microsoft_FStar_Absyn_Syntax.v, e)))::s
end
| _ -> begin
(failwith ("Impossible"))
end)
end)

let set_lcomp_result = (fun lc t -> (let _338732 = lc
in {Microsoft_FStar_Absyn_Syntax.eff_name = _338732.Microsoft_FStar_Absyn_Syntax.eff_name; Microsoft_FStar_Absyn_Syntax.res_typ = t; Microsoft_FStar_Absyn_Syntax.cflags = _338732.Microsoft_FStar_Absyn_Syntax.cflags; Microsoft_FStar_Absyn_Syntax.comp = (fun _338734 -> (match (_338734) with
| () -> begin
(Microsoft_FStar_Absyn_Util.set_result_typ (lc.Microsoft_FStar_Absyn_Syntax.comp ()) t)
end))}))

let value_check_expected_typ = (fun env e tlc -> (let lc = (match (tlc) with
| Support.Microsoft.FStar.Util.Inl (t) -> begin
(Microsoft_FStar_Tc_Util.lcomp_of_comp (if (not ((Microsoft_FStar_Absyn_Util.is_pure_or_ghost_function t))) then begin
(Microsoft_FStar_Absyn_Syntax.mk_Total t)
end else begin
(Microsoft_FStar_Tc_Util.return_value env t e)
end))
end
| Support.Microsoft.FStar.Util.Inr (lc) -> begin
lc
end)
in (let t = lc.Microsoft_FStar_Absyn_Syntax.res_typ
in (let _338758 = (match ((Microsoft_FStar_Tc_Env.expected_typ env)) with
| None -> begin
(e, lc, Microsoft_FStar_Tc_Rel.trivial_guard)
end
| Some (t') -> begin
(let _338747 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "Computed return type %s; expected type %s\n" (Microsoft_FStar_Absyn_Print.typ_to_string t) (Microsoft_FStar_Absyn_Print.typ_to_string t'))
end
in (let _338751 = (Microsoft_FStar_Tc_Util.check_and_ascribe env e t t')
in (match (_338751) with
| (e, g) -> begin
(let _338754 = (Microsoft_FStar_Tc_Util.strengthen_precondition (Some (Microsoft_FStar_Tc_Errors.subtyping_failed env t t')) env e lc g)
in (match (_338754) with
| (lc, g) -> begin
(e, (set_lcomp_result lc t'), g)
end))
end)))
end)
in (match (_338758) with
| (e, lc, g) -> begin
(let _338759 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint1 "Return comp type is %s\n" (Microsoft_FStar_Absyn_Print.lcomp_typ_to_string lc))
end
in (e, lc, g))
end)))))

let comp_check_expected_typ = (fun env e lc -> (match ((Microsoft_FStar_Tc_Env.expected_typ env)) with
| None -> begin
(e, lc, Microsoft_FStar_Tc_Rel.trivial_guard)
end
| Some (t) -> begin
(Microsoft_FStar_Tc_Util.weaken_result_typ env e lc t)
end))

let check_expected_effect = (fun env copt _338771 -> (match (_338771) with
| (e, c) -> begin
(let expected_c_opt = (match (copt) with
| Some (_) -> begin
copt
end
| None -> begin
(let c1 = (Microsoft_FStar_Tc_Normalize.weak_norm_comp env c)
in (let md = (Microsoft_FStar_Tc_Env.get_effect_decl env c1.Microsoft_FStar_Absyn_Syntax.effect_name)
in (match ((Microsoft_FStar_Tc_Env.default_effect env md.Microsoft_FStar_Absyn_Syntax.mname)) with
| None -> begin
None
end
| Some (l) -> begin
(let flags = if (Microsoft_FStar_Absyn_Syntax.lid_equals l Microsoft_FStar_Absyn_Const.tot_effect_lid) then begin
(Microsoft_FStar_Absyn_Syntax.TOTAL)::[]
end else begin
if (Microsoft_FStar_Absyn_Syntax.lid_equals l Microsoft_FStar_Absyn_Const.ml_effect_lid) then begin
(Microsoft_FStar_Absyn_Syntax.MLEFFECT)::[]
end else begin
[]
end
end
in (let def = (Microsoft_FStar_Absyn_Syntax.mk_Comp {Microsoft_FStar_Absyn_Syntax.effect_name = l; Microsoft_FStar_Absyn_Syntax.result_typ = c1.Microsoft_FStar_Absyn_Syntax.result_typ; Microsoft_FStar_Absyn_Syntax.effect_args = []; Microsoft_FStar_Absyn_Syntax.flags = flags})
in Some (def)))
end)))
end)
in (match (expected_c_opt) with
| None -> begin
(e, (norm_c env c), Microsoft_FStar_Tc_Rel.trivial_guard)
end
| Some (expected_c) -> begin
(let _338787 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint3 "\x28%s\x29 About to check\n\t%s\nagainst expected effect\n\t%s\n" (Support.Microsoft.FStar.Range.string_of_range e.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.comp_typ_to_string c) (Microsoft_FStar_Absyn_Print.comp_typ_to_string expected_c))
end
in (let c = (norm_c env c)
in (let expected_c' = (Microsoft_FStar_Tc_Util.refresh_comp_label env true (Microsoft_FStar_Tc_Util.lcomp_of_comp expected_c))
in (let _338795 = ((Microsoft_FStar_Tc_Util.check_comp env e c) (expected_c'.Microsoft_FStar_Absyn_Syntax.comp ()))
in (match (_338795) with
| (e, _, g) -> begin
(let _338796 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint2 "\x28%s\x29 DONE check\x5fexpected\x5feffect; guard is: %s\n" (Support.Microsoft.FStar.Range.string_of_range e.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Tc_Rel.guard_to_string env g))
end
in (e, expected_c, g))
end)))))
end))
end))

let no_logical_guard = (fun env _338802 -> (match (_338802) with
| (te, kt, f) -> begin
(match ((Microsoft_FStar_Tc_Rel.guard_f f)) with
| Microsoft_FStar_Tc_Rel.Trivial -> begin
(te, kt, f)
end
| Microsoft_FStar_Tc_Rel.NonTrivial (f) -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Microsoft_FStar_Tc_Errors.unexpected_non_trivial_precondition_on_term env f), (Microsoft_FStar_Tc_Env.get_range env)))))
end)
end))

let binding_of_lb = (fun x t -> (match (x) with
| Support.Microsoft.FStar.Util.Inl (bvd) -> begin
Microsoft_FStar_Tc_Env.Binding_var ((bvd, t))
end
| Support.Microsoft.FStar.Util.Inr (lid) -> begin
Microsoft_FStar_Tc_Env.Binding_lid ((lid, t))
end))

let print_expected_ty = (fun env -> (match ((Microsoft_FStar_Tc_Env.expected_typ env)) with
| None -> begin
(Support.Microsoft.FStar.Util.print_string "Expected type is None")
end
| Some (t) -> begin
(Support.Microsoft.FStar.Util.fprint1 "Expected type is %s" (Microsoft_FStar_Absyn_Print.typ_to_string t))
end))

let with_implicits = (fun imps _338820 -> (match (_338820) with
| (e, l, g) -> begin
(e, l, (let _338821 = g
in {Microsoft_FStar_Tc_Rel.guard_f = _338821.Microsoft_FStar_Tc_Rel.guard_f; Microsoft_FStar_Tc_Rel.deferred = _338821.Microsoft_FStar_Tc_Rel.deferred; Microsoft_FStar_Tc_Rel.implicits = (Support.List.append imps g.Microsoft_FStar_Tc_Rel.implicits)}))
end))

let add_implicit = (fun u g -> (let _338825 = g
in {Microsoft_FStar_Tc_Rel.guard_f = _338825.Microsoft_FStar_Tc_Rel.guard_f; Microsoft_FStar_Tc_Rel.deferred = _338825.Microsoft_FStar_Tc_Rel.deferred; Microsoft_FStar_Tc_Rel.implicits = (u)::g.Microsoft_FStar_Tc_Rel.implicits}))

let rec tc_kind = (fun env k -> (let k = (Microsoft_FStar_Absyn_Util.compress_kind k)
in (let w = (fun f -> (f k.Microsoft_FStar_Absyn_Syntax.pos))
in (match (k.Microsoft_FStar_Absyn_Syntax.n) with
| (Microsoft_FStar_Absyn_Syntax.Kind_lam (_)) | (Microsoft_FStar_Absyn_Syntax.Kind_delayed (_)) -> begin
(failwith ("impossible"))
end
| (Microsoft_FStar_Absyn_Syntax.Kind_type) | (Microsoft_FStar_Absyn_Syntax.Kind_effect) -> begin
(k, Microsoft_FStar_Tc_Rel.trivial_guard)
end
| Microsoft_FStar_Absyn_Syntax.Kind_uvar ((u, args)) -> begin
(let _338844 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Medium) then begin
(Support.Microsoft.FStar.Util.fprint2 "\x28%s\x29 - Checking kind %s" (Support.Microsoft.FStar.Range.string_of_range k.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.kind_to_string k))
end
in (let _338849 = (Microsoft_FStar_Tc_Env.clear_expected_typ env)
in (match (_338849) with
| (env, _) -> begin
(let _338852 = (tc_args env args)
in (match (_338852) with
| (args, g) -> begin
((w (Microsoft_FStar_Absyn_Syntax.mk_Kind_uvar (u, args))), g)
end))
end)))
end
| Microsoft_FStar_Absyn_Syntax.Kind_abbrev (((l, args), {Microsoft_FStar_Absyn_Syntax.n = Microsoft_FStar_Absyn_Syntax.Kind_unknown; Microsoft_FStar_Absyn_Syntax.tk = _; Microsoft_FStar_Absyn_Syntax.pos = _; Microsoft_FStar_Absyn_Syntax.fvs = _; Microsoft_FStar_Absyn_Syntax.uvs = _})) -> begin
(let _338872 = (Microsoft_FStar_Tc_Env.lookup_kind_abbrev env l)
in (match (_338872) with
| (_, binders, body) -> begin
(let _338875 = (tc_args env args)
in (match (_338875) with
| (args, g) -> begin
if ((Support.List.length binders) <> (Support.List.length args)) then begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Support.String.strcat "Unexpected number of arguments to kind abbreviation " (Microsoft_FStar_Absyn_Print.sli l)), k.Microsoft_FStar_Absyn_Syntax.pos))))
end else begin
(let _338908 = (Support.List.fold_left2 (fun _338879 b a -> (match (_338879) with
| (subst, args, guards) -> begin
(match (((Support.Prims.fst b), (Support.Prims.fst a))) with
| (Support.Microsoft.FStar.Util.Inl (a), Support.Microsoft.FStar.Util.Inl (t)) -> begin
(let _338889 = (tc_typ_check env t (Microsoft_FStar_Absyn_Util.subst_kind subst a.Microsoft_FStar_Absyn_Syntax.sort))
in (match (_338889) with
| (t, g) -> begin
(let subst = (Support.Microsoft.FStar.Util.Inl ((a.Microsoft_FStar_Absyn_Syntax.v, t)))::subst
in (subst, ((Microsoft_FStar_Absyn_Syntax.targ t))::args, (g)::guards))
end))
end
| (Support.Microsoft.FStar.Util.Inr (x), Support.Microsoft.FStar.Util.Inr (e)) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_expected_typ env (Microsoft_FStar_Absyn_Util.subst_typ subst x.Microsoft_FStar_Absyn_Syntax.sort))
in (let _338901 = (tc_ghost_exp env e)
in (match (_338901) with
| (e, _, g) -> begin
(let subst = (Support.Microsoft.FStar.Util.Inr ((x.Microsoft_FStar_Absyn_Syntax.v, e)))::subst
in (subst, ((Microsoft_FStar_Absyn_Syntax.varg e))::args, (g)::guards))
end)))
end
| _ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Ill-typed argument to kind abbreviation", (Microsoft_FStar_Absyn_Util.range_of_arg a)))))
end)
end)) ([], [], []) binders args)
in (match (_338908) with
| (subst, args, guards) -> begin
(let args = (Support.List.rev args)
in (let k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_abbrev ((l, args), Microsoft_FStar_Absyn_Syntax.mk_Kind_unknown)))
in (let k' = (Microsoft_FStar_Tc_Normalize.norm_kind ((Microsoft_FStar_Tc_Normalize.DeltaHard)::[]) env k)
in (let k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_abbrev ((l, args), k')))
in (k', (Support.List.fold_left Microsoft_FStar_Tc_Rel.conj_guard g guards))))))
end))
end
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Kind_abbrev ((kabr, k)) -> begin
(let _338919 = (tc_kind env k)
in (match (_338919) with
| (k, f) -> begin
(let _338922 = ((tc_args env) (Support.Prims.snd kabr))
in (match (_338922) with
| (args, g) -> begin
(let kabr = ((Support.Prims.fst kabr), args)
in (let kk = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_abbrev (kabr, k)))
in (kk, (Microsoft_FStar_Tc_Rel.conj_guard f g))))
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Kind_arrow ((bs, k)) -> begin
(let _338932 = (tc_binders env bs)
in (match (_338932) with
| (bs, env, g) -> begin
(let _338935 = (tc_kind env k)
in (match (_338935) with
| (k, f) -> begin
(let f = (Microsoft_FStar_Tc_Rel.close_guard bs f)
in ((w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (bs, k))), (Microsoft_FStar_Tc_Rel.conj_guard g f)))
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Kind_unknown -> begin
((Microsoft_FStar_Tc_Util.new_kvar env), Microsoft_FStar_Tc_Rel.trivial_guard)
end))))
and tc_vbinder = (fun env x -> (let _338942 = (tc_typ_check env x.Microsoft_FStar_Absyn_Syntax.sort Microsoft_FStar_Absyn_Syntax.ktype)
in (match (_338942) with
| (t, g) -> begin
(let x = (let _338943 = x
in {Microsoft_FStar_Absyn_Syntax.v = _338943.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = t; Microsoft_FStar_Absyn_Syntax.p = _338943.Microsoft_FStar_Absyn_Syntax.p})
in (let env' = (maybe_push_binding env (Microsoft_FStar_Absyn_Syntax.v_binder x))
in (x, env', g)))
end)))
and tc_binders = (fun env bs -> (let rec aux = (fun env bs -> (match (bs) with
| [] -> begin
([], env, Microsoft_FStar_Tc_Rel.trivial_guard)
end
| (b, imp)::bs -> begin
(match (b) with
| Support.Microsoft.FStar.Util.Inl (a) -> begin
(let _338962 = (tc_kind env a.Microsoft_FStar_Absyn_Syntax.sort)
in (match (_338962) with
| (k, g) -> begin
(let b = (Support.Microsoft.FStar.Util.Inl ((let _338963 = a
in {Microsoft_FStar_Absyn_Syntax.v = _338963.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = k; Microsoft_FStar_Absyn_Syntax.p = _338963.Microsoft_FStar_Absyn_Syntax.p})), imp)
in (let env' = (maybe_push_binding env b)
in (let _338970 = (aux env' bs)
in (match (_338970) with
| (bs, env', g') -> begin
((b)::bs, env', (Microsoft_FStar_Tc_Rel.conj_guard g (Microsoft_FStar_Tc_Rel.close_guard ((b)::[]) g')))
end))))
end))
end
| Support.Microsoft.FStar.Util.Inr (x) -> begin
(let _338976 = (tc_vbinder env x)
in (match (_338976) with
| (x, env', g) -> begin
(let b = (Support.Microsoft.FStar.Util.Inr (x), imp)
in (let _338981 = (aux env' bs)
in (match (_338981) with
| (bs, env', g') -> begin
((b)::bs, env', (Microsoft_FStar_Tc_Rel.conj_guard g (Microsoft_FStar_Tc_Rel.close_guard ((b)::[]) g')))
end)))
end))
end)
end))
in (aux env bs)))
and tc_args = (fun env args -> (Support.List.fold_right (fun _338986 _338989 -> (match ((_338986, _338989)) with
| ((arg, imp), (args, g)) -> begin
(match (arg) with
| Support.Microsoft.FStar.Util.Inl (t) -> begin
(let _338996 = (tc_typ env t)
in (match (_338996) with
| (t, _, g') -> begin
(((Support.Microsoft.FStar.Util.Inl (t), imp))::args, (Microsoft_FStar_Tc_Rel.conj_guard g g'))
end))
end
| Support.Microsoft.FStar.Util.Inr (e) -> begin
(let _339003 = (tc_ghost_exp env e)
in (match (_339003) with
| (e, _, g') -> begin
(((Support.Microsoft.FStar.Util.Inr (e), imp))::args, (Microsoft_FStar_Tc_Rel.conj_guard g g'))
end))
end)
end)) args ([], Microsoft_FStar_Tc_Rel.trivial_guard)))
and tc_comp = (fun env c -> (match (c.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Total (t) -> begin
(let _339010 = (tc_typ_check env t Microsoft_FStar_Absyn_Syntax.ktype)
in (match (_339010) with
| (t, g) -> begin
((Microsoft_FStar_Absyn_Syntax.mk_Total t), g)
end))
end
| Microsoft_FStar_Absyn_Syntax.Comp (c) -> begin
(let kc = (Microsoft_FStar_Tc_Env.lookup_effect_lid env c.Microsoft_FStar_Absyn_Syntax.effect_name)
in (let head = (Microsoft_FStar_Absyn_Util.ftv c.Microsoft_FStar_Absyn_Syntax.effect_name kc)
in (let tc = (Microsoft_FStar_Absyn_Syntax.mk_Typ_app (head, ((Microsoft_FStar_Absyn_Syntax.targ c.Microsoft_FStar_Absyn_Syntax.result_typ))::c.Microsoft_FStar_Absyn_Syntax.effect_args) None c.Microsoft_FStar_Absyn_Syntax.result_typ.Microsoft_FStar_Absyn_Syntax.pos)
in (let _339018 = (tc_typ_check env tc Microsoft_FStar_Absyn_Syntax.keffect)
in (match (_339018) with
| (tc, f) -> begin
(let _339022 = (Microsoft_FStar_Absyn_Util.head_and_args tc)
in (match (_339022) with
| (_, args) -> begin
(let _339034 = (match (args) with
| (Support.Microsoft.FStar.Util.Inl (res), _)::args -> begin
(res, args)
end
| _ -> begin
(failwith ("Impossible"))
end)
in (match (_339034) with
| (res, args) -> begin
(let _339050 = ((Support.List.unzip) ((Support.List.map (fun _338602 -> (match (_338602) with
| Microsoft_FStar_Absyn_Syntax.DECREASES (e) -> begin
(let _339041 = (Microsoft_FStar_Tc_Env.clear_expected_typ env)
in (match (_339041) with
| (env, _) -> begin
(let _339046 = (tc_ghost_exp env e)
in (match (_339046) with
| (e, _, g) -> begin
(Microsoft_FStar_Absyn_Syntax.DECREASES (e), g)
end))
end))
end
| f -> begin
(f, Microsoft_FStar_Tc_Rel.trivial_guard)
end))) c.Microsoft_FStar_Absyn_Syntax.flags))
in (match (_339050) with
| (flags, guards) -> begin
((Microsoft_FStar_Absyn_Syntax.mk_Comp (let _339051 = c
in {Microsoft_FStar_Absyn_Syntax.effect_name = _339051.Microsoft_FStar_Absyn_Syntax.effect_name; Microsoft_FStar_Absyn_Syntax.result_typ = res; Microsoft_FStar_Absyn_Syntax.effect_args = args; Microsoft_FStar_Absyn_Syntax.flags = _339051.Microsoft_FStar_Absyn_Syntax.flags})), (Support.List.fold_left Microsoft_FStar_Tc_Rel.conj_guard f guards))
end))
end))
end))
end)))))
end))
and tc_typ = (fun env t -> (let env = (Microsoft_FStar_Tc_Env.set_range env t.Microsoft_FStar_Absyn_Syntax.pos)
in (let w = (fun k -> (Microsoft_FStar_Absyn_Syntax.syn t.Microsoft_FStar_Absyn_Syntax.pos (Some (k))))
in (let t = (Microsoft_FStar_Absyn_Util.compress_typ t)
in (let top = t
in (match (t.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_btvar (a) -> begin
(let k = (Microsoft_FStar_Tc_Env.lookup_btvar env a)
in (let a = (let _339063 = a
in {Microsoft_FStar_Absyn_Syntax.v = _339063.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = k; Microsoft_FStar_Absyn_Syntax.p = _339063.Microsoft_FStar_Absyn_Syntax.p})
in (let t = ((w k) (Microsoft_FStar_Absyn_Syntax.mk_Typ_btvar a))
in (let _339070 = (Microsoft_FStar_Tc_Util.maybe_instantiate_typ env t k)
in (match (_339070) with
| (t, k, implicits) -> begin
((with_implicits implicits) (t, k, Microsoft_FStar_Tc_Rel.trivial_guard))
end)))))
end
| Microsoft_FStar_Absyn_Syntax.Typ_const (i) when (Microsoft_FStar_Absyn_Syntax.lid_equals i.Microsoft_FStar_Absyn_Syntax.v Microsoft_FStar_Absyn_Const.eqT_lid) -> begin
(let k = (Microsoft_FStar_Tc_Util.new_kvar env)
in (let qk = (Microsoft_FStar_Absyn_Util.eqT_k k)
in (let i = (let _339075 = i
in {Microsoft_FStar_Absyn_Syntax.v = _339075.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = qk; Microsoft_FStar_Absyn_Syntax.p = _339075.Microsoft_FStar_Absyn_Syntax.p})
in ((Microsoft_FStar_Absyn_Syntax.mk_Typ_const i (Some (qk)) t.Microsoft_FStar_Absyn_Syntax.pos), qk, Microsoft_FStar_Tc_Rel.trivial_guard))))
end
| Microsoft_FStar_Absyn_Syntax.Typ_const (i) when ((Microsoft_FStar_Absyn_Syntax.lid_equals i.Microsoft_FStar_Absyn_Syntax.v Microsoft_FStar_Absyn_Const.allTyp_lid) || (Microsoft_FStar_Absyn_Syntax.lid_equals i.Microsoft_FStar_Absyn_Syntax.v Microsoft_FStar_Absyn_Const.exTyp_lid)) -> begin
(let k = (Microsoft_FStar_Tc_Util.new_kvar env)
in (let qk = (Microsoft_FStar_Absyn_Util.allT_k k)
in (let i = (let _339082 = i
in {Microsoft_FStar_Absyn_Syntax.v = _339082.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = qk; Microsoft_FStar_Absyn_Syntax.p = _339082.Microsoft_FStar_Absyn_Syntax.p})
in ((Microsoft_FStar_Absyn_Syntax.mk_Typ_const i (Some (qk)) t.Microsoft_FStar_Absyn_Syntax.pos), qk, Microsoft_FStar_Tc_Rel.trivial_guard))))
end
| Microsoft_FStar_Absyn_Syntax.Typ_const (i) -> begin
(let k = (match ((Microsoft_FStar_Tc_Env.try_lookup_effect_lid env i.Microsoft_FStar_Absyn_Syntax.v)) with
| Some (k) -> begin
k
end
| _ -> begin
(Microsoft_FStar_Tc_Env.lookup_typ_lid env i.Microsoft_FStar_Absyn_Syntax.v)
end)
in (let i = (let _339092 = i
in {Microsoft_FStar_Absyn_Syntax.v = _339092.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = k; Microsoft_FStar_Absyn_Syntax.p = _339092.Microsoft_FStar_Absyn_Syntax.p})
in (let t = (Microsoft_FStar_Absyn_Syntax.mk_Typ_const i (Some (k)) t.Microsoft_FStar_Absyn_Syntax.pos)
in (let _339099 = (Microsoft_FStar_Tc_Util.maybe_instantiate_typ env t k)
in (match (_339099) with
| (t, k, imps) -> begin
((with_implicits imps) (t, k, Microsoft_FStar_Tc_Rel.trivial_guard))
end)))))
end
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((bs, cod)) -> begin
(let _339107 = (tc_binders env bs)
in (match (_339107) with
| (bs, env, g) -> begin
(let _339110 = (tc_comp env cod)
in (match (_339110) with
| (cod, f) -> begin
(((w Microsoft_FStar_Absyn_Syntax.ktype) (Microsoft_FStar_Absyn_Syntax.mk_Typ_fun (bs, cod))), Microsoft_FStar_Absyn_Syntax.ktype, (Microsoft_FStar_Tc_Rel.conj_guard g (Microsoft_FStar_Tc_Rel.close_guard bs f)))
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_lam ((bs, t)) -> begin
(let _339118 = (tc_binders env bs)
in (match (_339118) with
| (bs, env, g) -> begin
(let _339122 = (tc_typ env t)
in (match (_339122) with
| (t, k, f) -> begin
(let k = (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (bs, k) top.Microsoft_FStar_Absyn_Syntax.pos)
in (((w k) (Microsoft_FStar_Absyn_Syntax.mk_Typ_lam (bs, t))), k, ((Microsoft_FStar_Tc_Rel.conj_guard g) (Microsoft_FStar_Tc_Rel.close_guard bs f))))
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_refine ((x, phi)) -> begin
(let _339131 = (tc_vbinder env x)
in (match (_339131) with
| (x, env, f1) -> begin
(let _339135 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint3 "\x28%s\x29 Checking refinement formula %s; env expects type %s\n" (Support.Microsoft.FStar.Range.string_of_range top.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.typ_to_string phi) (match ((Microsoft_FStar_Tc_Env.expected_typ env)) with
| None -> begin
"None"
end
| Some (t) -> begin
(Microsoft_FStar_Absyn_Print.typ_to_string t)
end))
end
in (let _339139 = (tc_typ_check env phi Microsoft_FStar_Absyn_Syntax.ktype)
in (match (_339139) with
| (phi, f2) -> begin
(((w Microsoft_FStar_Absyn_Syntax.ktype) (Microsoft_FStar_Absyn_Syntax.mk_Typ_refine (x, phi))), Microsoft_FStar_Absyn_Syntax.ktype, (Microsoft_FStar_Tc_Rel.conj_guard f1 (Microsoft_FStar_Tc_Rel.close_guard (((Microsoft_FStar_Absyn_Syntax.v_binder x))::[]) f2)))
end)))
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_app ((head, args)) -> begin
(let _339144 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Extreme) then begin
(Support.Microsoft.FStar.Util.fprint3 "\x28%s\x29 Checking type application \x28%s\x29: %s\n" (Support.Microsoft.FStar.Range.string_of_range top.Microsoft_FStar_Absyn_Syntax.pos) (Support.Microsoft.FStar.Util.string_of_int (Support.List.length args)) (Microsoft_FStar_Absyn_Print.typ_to_string top))
end
in (let _339149 = (tc_typ (no_inst env) head)
in (match (_339149) with
| (head, k1', f1) -> begin
(let args0 = args
in (let k1 = (Microsoft_FStar_Tc_Normalize.norm_kind ((Microsoft_FStar_Tc_Normalize.WHNF)::(Microsoft_FStar_Tc_Normalize.Beta)::[]) env k1')
in (let _339152 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Extreme) then begin
(Support.Microsoft.FStar.Util.fprint4 "\x28%s\x29 head %s has kind %s ... after norm %s\n" (Support.Microsoft.FStar.Range.string_of_range head.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.typ_to_string head) (Microsoft_FStar_Absyn_Print.kind_to_string k1') (Microsoft_FStar_Absyn_Print.kind_to_string k1))
end
in (let check_app = (fun _339155 -> (match (_339155) with
| () -> begin
(match (k1.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Kind_uvar (_) -> begin
(let _339161 = (tc_args env args)
in (match (_339161) with
| (args, g) -> begin
(let fvs = (Microsoft_FStar_Absyn_Util.freevars_kind k1)
in (let binders = (Microsoft_FStar_Absyn_Util.binders_of_freevars fvs)
in (let kres = ((Support.Prims.fst) (Microsoft_FStar_Tc_Rel.new_kvar k1.Microsoft_FStar_Absyn_Syntax.pos binders))
in (let bs = (Microsoft_FStar_Absyn_Util.null_binders_of_tks (Microsoft_FStar_Tc_Util.tks_of_args args))
in (let kar = (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (bs, kres) k1.Microsoft_FStar_Absyn_Syntax.pos)
in (let _339167 = ((Microsoft_FStar_Tc_Util.force_trivial env) (Microsoft_FStar_Tc_Rel.keq env None k1 kar))
in (kres, args, g)))))))
end))
end
| Microsoft_FStar_Absyn_Syntax.Kind_arrow ((formals, kres)) -> begin
(let rec check_args = (fun outargs subst g formals args -> (match ((formals, args)) with
| ([], []) -> begin
((Microsoft_FStar_Absyn_Util.subst_kind subst kres), (Support.List.rev outargs), g)
end
| (((_, None)::_, (_, Some (Microsoft_FStar_Absyn_Syntax.Implicit))::_)) | (((_, Some (Microsoft_FStar_Absyn_Syntax.Equality))::_, (_, Some (Microsoft_FStar_Absyn_Syntax.Implicit))::_)) -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Argument is marked as instantiating an implicit parameter; although the expected parameter is explicit", (Microsoft_FStar_Absyn_Util.range_of_arg (Support.List.hd args))))))
end
| (((Support.Microsoft.FStar.Util.Inl (a), Some (Microsoft_FStar_Absyn_Syntax.Implicit))::rest, (_, None)::_)) | (((Support.Microsoft.FStar.Util.Inl (a), Some (Microsoft_FStar_Absyn_Syntax.Implicit))::rest, [])) -> begin
(let formal = (Support.List.hd formals)
in (let _339240 = (Microsoft_FStar_Tc_Util.new_implicit_tvar env (Microsoft_FStar_Absyn_Util.subst_kind subst a.Microsoft_FStar_Absyn_Syntax.sort))
in (match (_339240) with
| (t, u) -> begin
(let targ = (Support.Microsoft.FStar.Util.Inl (t), Some (Microsoft_FStar_Absyn_Syntax.Implicit))
in (let g = (add_implicit (Support.Microsoft.FStar.Util.Inl (u)) g)
in (let subst = (maybe_extend_subst subst formal targ)
in (check_args ((targ)::outargs) subst g rest args))))
end)))
end
| (((Support.Microsoft.FStar.Util.Inr (x), Some (Microsoft_FStar_Absyn_Syntax.Implicit))::rest, (_, None)::_)) | (((Support.Microsoft.FStar.Util.Inr (x), Some (Microsoft_FStar_Absyn_Syntax.Implicit))::rest, [])) -> begin
(let formal = (Support.List.hd formals)
in (let _339269 = (Microsoft_FStar_Tc_Util.new_implicit_evar env (Microsoft_FStar_Absyn_Util.subst_typ subst x.Microsoft_FStar_Absyn_Syntax.sort))
in (match (_339269) with
| (e, u) -> begin
(let varg = (Support.Microsoft.FStar.Util.Inr (e), Some (Microsoft_FStar_Absyn_Syntax.Implicit))
in (let g = (add_implicit (Support.Microsoft.FStar.Util.Inr (u)) g)
in (let subst = (maybe_extend_subst subst formal varg)
in (check_args ((varg)::outargs) subst g rest args))))
end)))
end
| (formal::formals, actual::actuals) -> begin
(match ((formal, actual)) with
| ((Support.Microsoft.FStar.Util.Inl (a), aqual), (Support.Microsoft.FStar.Util.Inl (t), imp)) -> begin
(let formal_k = (Microsoft_FStar_Absyn_Util.subst_kind subst a.Microsoft_FStar_Absyn_Syntax.sort)
in (let _339290 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "Checking argument %s against expected kind %s\n" (Microsoft_FStar_Absyn_Print.arg_to_string actual) (Microsoft_FStar_Absyn_Print.kind_to_string formal_k))
end
in (let _339296 = (tc_typ_check (let _339292 = env
in {Microsoft_FStar_Tc_Env.solver = _339292.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _339292.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _339292.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _339292.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _339292.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _339292.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _339292.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _339292.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _339292.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _339292.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _339292.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _339292.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _339292.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _339292.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _339292.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _339292.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = (is_eq aqual); Microsoft_FStar_Tc_Env.is_iface = _339292.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _339292.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _339292.Microsoft_FStar_Tc_Env.default_effects}) t formal_k)
in (match (_339296) with
| (t, g') -> begin
(let _339297 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint1 ">>>Got guard %s\n" (Microsoft_FStar_Tc_Rel.guard_to_string env g'))
end
in (let actual = (Support.Microsoft.FStar.Util.Inl (t), imp)
in (let g' = (Microsoft_FStar_Tc_Rel.imp_guard (Microsoft_FStar_Tc_Rel.guard_of_guard_formula (Microsoft_FStar_Tc_Util.short_circuit_typ (Support.Microsoft.FStar.Util.Inl (head)) outargs)) g')
in (let subst = (maybe_extend_subst subst formal actual)
in (check_args ((actual)::outargs) subst (Microsoft_FStar_Tc_Rel.conj_guard g g') formals actuals)))))
end))))
end
| ((Support.Microsoft.FStar.Util.Inr (x), aqual), (Support.Microsoft.FStar.Util.Inr (v), imp)) -> begin
(let tx = (Microsoft_FStar_Absyn_Util.subst_typ subst x.Microsoft_FStar_Absyn_Syntax.sort)
in (let env' = (Microsoft_FStar_Tc_Env.set_expected_typ env tx)
in (let env' = (let _339313 = env'
in {Microsoft_FStar_Tc_Env.solver = _339313.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _339313.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _339313.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _339313.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _339313.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _339313.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _339313.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _339313.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _339313.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _339313.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _339313.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _339313.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _339313.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _339313.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _339313.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _339313.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = (is_eq aqual); Microsoft_FStar_Tc_Env.is_iface = _339313.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _339313.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _339313.Microsoft_FStar_Tc_Env.default_effects})
in (let _339316 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "Checking argument %s against expected type %s\n" (Microsoft_FStar_Absyn_Print.arg_to_string actual) (Microsoft_FStar_Absyn_Print.typ_to_string tx))
end
in (let _339322 = (tc_ghost_exp env' v)
in (match (_339322) with
| (v, _, g') -> begin
(let actual = (Support.Microsoft.FStar.Util.Inr (v), imp)
in (let g' = (Microsoft_FStar_Tc_Rel.imp_guard (Microsoft_FStar_Tc_Rel.guard_of_guard_formula (Microsoft_FStar_Tc_Util.short_circuit_typ (Support.Microsoft.FStar.Util.Inl (head)) outargs)) g')
in (let subst = (maybe_extend_subst subst formal actual)
in (check_args ((actual)::outargs) subst (Microsoft_FStar_Tc_Rel.conj_guard g g') formals actuals))))
end))))))
end
| ((Support.Microsoft.FStar.Util.Inl (a), _), (Support.Microsoft.FStar.Util.Inr (v), imp)) -> begin
(match (a.Microsoft_FStar_Absyn_Syntax.sort.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Kind_type -> begin
(let tv = (Microsoft_FStar_Absyn_Util.b2t v)
in (check_args outargs subst g ((formal)::formals) (((Microsoft_FStar_Absyn_Syntax.targ tv))::actuals)))
end
| _ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Expected a type; got an expression", v.Microsoft_FStar_Absyn_Syntax.pos))))
end)
end
| ((Support.Microsoft.FStar.Util.Inr (_), _), (Support.Microsoft.FStar.Util.Inl (_), _)) -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Expected an expression; got a type", (Microsoft_FStar_Absyn_Util.range_of_arg actual)))))
end)
end
| (_, []) -> begin
((Microsoft_FStar_Absyn_Util.subst_kind subst (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (formals, kres) kres.Microsoft_FStar_Absyn_Syntax.pos)), (Support.List.rev outargs), g)
end
| ([], _) -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Support.Microsoft.FStar.Util.format2 "Too many arguments to type; expected %s arguments but got %s" (Support.Microsoft.FStar.Util.string_of_int (Support.List.length ((Support.List.filter (fun _338603 -> (match (_338603) with
| (_, Some (Microsoft_FStar_Absyn_Syntax.Implicit)) -> begin
false
end
| _ -> begin
true
end))) outargs))) (Support.Microsoft.FStar.Util.string_of_int (Support.List.length args0))), top.Microsoft_FStar_Absyn_Syntax.pos))))
end))
in (check_args [] [] f1 formals args))
end
| _ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Microsoft_FStar_Tc_Errors.expected_tcon_kind env top k1), top.Microsoft_FStar_Absyn_Syntax.pos))))
end)
end))
in (match (((Microsoft_FStar_Absyn_Util.compress_typ head).Microsoft_FStar_Absyn_Syntax.n, (Microsoft_FStar_Absyn_Util.compress_kind k1).Microsoft_FStar_Absyn_Syntax.n)) with
| (Microsoft_FStar_Absyn_Syntax.Typ_uvar (_), Microsoft_FStar_Absyn_Syntax.Kind_arrow ((formals, k))) when ((Support.List.length args) = (Support.List.length formals)) -> begin
(let result_k = (let s = (Support.List.map2 Microsoft_FStar_Absyn_Util.subst_formal formals args)
in (Microsoft_FStar_Absyn_Util.subst_kind s k))
in (let t = (Microsoft_FStar_Absyn_Syntax.mk_Typ_app (head, args) (Some (result_k)) top.Microsoft_FStar_Absyn_Syntax.pos)
in (t, result_k, Microsoft_FStar_Tc_Rel.trivial_guard)))
end
| _ -> begin
(let _339387 = (check_app ())
in (match (_339387) with
| (k, args, g) -> begin
(let t = (Microsoft_FStar_Absyn_Syntax.mk_Typ_app (head, args) (Some (k)) top.Microsoft_FStar_Absyn_Syntax.pos)
in (t, k, g))
end))
end)))))
end)))
end
| Microsoft_FStar_Absyn_Syntax.Typ_ascribed ((t1, k1)) -> begin
(let _339395 = (tc_kind env k1)
in (match (_339395) with
| (k1, f1) -> begin
(let _339398 = (tc_typ_check env t1 k1)
in (match (_339398) with
| (t1, f2) -> begin
(((w k1) (Microsoft_FStar_Absyn_Syntax.mk_Typ_ascribed' (t1, k1))), k1, (Microsoft_FStar_Tc_Rel.conj_guard f1 f2))
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_uvar ((u, k1)) when env.Microsoft_FStar_Tc_Env.check_uvars -> begin
(let s = (Microsoft_FStar_Absyn_Util.compress_typ t)
in (match (s.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_uvar ((u, k1)) -> begin
(let _339410 = (tc_kind env k1)
in (match (_339410) with
| (k1, g) -> begin
(let _339414 = (Microsoft_FStar_Tc_Rel.new_tvar s.Microsoft_FStar_Absyn_Syntax.pos [] k1)
in (match (_339414) with
| (_, u') -> begin
(let _339415 = (Microsoft_FStar_Absyn_Util.unchecked_unify u u')
in (u', k1, g))
end))
end))
end
| _ -> begin
(tc_typ env s)
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_uvar ((_, k1)) -> begin
(let s = (Microsoft_FStar_Absyn_Util.compress_typ t)
in (match (s.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_uvar ((u, k1)) -> begin
(let _339429 = if ((Microsoft_FStar_Tc_Env.debug env) Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "Admitting un-instantiated uvar %s at kind %s\n" (Microsoft_FStar_Absyn_Print.typ_to_string s) (Microsoft_FStar_Absyn_Print.kind_to_string k1))
end
in (((w k1) (Microsoft_FStar_Absyn_Syntax.mk_Typ_uvar' (u, k1))), k1, Microsoft_FStar_Tc_Rel.trivial_guard))
end
| _ -> begin
(let _339433 = if ((Microsoft_FStar_Tc_Env.debug env) Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "Admitting instantiated uvar %s at kind %s\n" (Microsoft_FStar_Absyn_Print.typ_to_string s) (Microsoft_FStar_Absyn_Print.kind_to_string k1))
end
in (s, k1, Microsoft_FStar_Tc_Rel.trivial_guard))
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_meta (Microsoft_FStar_Absyn_Syntax.Meta_refresh_label ((t, b, r))) -> begin
(let _339444 = (tc_typ env t)
in (match (_339444) with
| (t, k, f) -> begin
((Microsoft_FStar_Absyn_Syntax.mk_Typ_meta (Microsoft_FStar_Absyn_Syntax.Meta_refresh_label ((t, b, r)))), k, f)
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_meta (Microsoft_FStar_Absyn_Syntax.Meta_labeled ((t, l, r, p))) -> begin
(let _339455 = (tc_typ env t)
in (match (_339455) with
| (t, k, f) -> begin
((Microsoft_FStar_Absyn_Syntax.mk_Typ_meta (Microsoft_FStar_Absyn_Syntax.Meta_labeled ((t, l, r, p)))), k, f)
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_meta (Microsoft_FStar_Absyn_Syntax.Meta_named ((t, l))) -> begin
(let _339464 = (tc_typ env t)
in (match (_339464) with
| (t, k, f) -> begin
((Microsoft_FStar_Absyn_Syntax.mk_Typ_meta (Microsoft_FStar_Absyn_Syntax.Meta_named ((t, l)))), k, f)
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_meta (Microsoft_FStar_Absyn_Syntax.Meta_pattern ((qbody, pats))) -> begin
(let _339472 = (tc_typ_check env qbody Microsoft_FStar_Absyn_Syntax.ktype)
in (match (_339472) with
| (quant, f) -> begin
(let _339475 = (tc_args env pats)
in (match (_339475) with
| (pats, g) -> begin
((Microsoft_FStar_Absyn_Syntax.mk_Typ_meta (Microsoft_FStar_Absyn_Syntax.Meta_pattern ((quant, pats)))), (Microsoft_FStar_Tc_Util.force_tk quant), (Microsoft_FStar_Tc_Rel.conj_guard f g))
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Typ_unknown -> begin
(let k = (Microsoft_FStar_Tc_Util.new_kvar env)
in (let t = (Microsoft_FStar_Tc_Util.new_tvar env k)
in (t, k, Microsoft_FStar_Tc_Rel.trivial_guard)))
end
| _ -> begin
(failwith ((Support.Microsoft.FStar.Util.format1 "Unexpected type : %s\n" (Microsoft_FStar_Absyn_Print.typ_to_string t))))
end))))))
and tc_typ_check = (fun env t k -> (let _339487 = (tc_typ env t)
in (match (_339487) with
| (t, k', f) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_range env t.Microsoft_FStar_Absyn_Syntax.pos)
in (let f' = if env.Microsoft_FStar_Tc_Env.use_eq then begin
(Microsoft_FStar_Tc_Rel.keq env (Some (t)) k' k)
end else begin
(Microsoft_FStar_Tc_Rel.subkind env k' k)
end
in (let f = (Microsoft_FStar_Tc_Rel.conj_guard f f')
in (t, f))))
end)))
and tc_value = (fun env e -> (let env = (Microsoft_FStar_Tc_Env.set_range env e.Microsoft_FStar_Absyn_Syntax.pos)
in (let top = e
in (match (e.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Exp_uvar ((_, t1)) -> begin
(value_check_expected_typ env e (Support.Microsoft.FStar.Util.Inl (t1)))
end
| Microsoft_FStar_Absyn_Syntax.Exp_bvar (x) -> begin
(let t = (Microsoft_FStar_Tc_Env.lookup_bvar env x)
in (let e = (Microsoft_FStar_Absyn_Syntax.mk_Exp_bvar (let _339503 = x
in {Microsoft_FStar_Absyn_Syntax.v = _339503.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = t; Microsoft_FStar_Absyn_Syntax.p = _339503.Microsoft_FStar_Absyn_Syntax.p}) (Some (t)) e.Microsoft_FStar_Absyn_Syntax.pos)
in (let _339509 = (Microsoft_FStar_Tc_Util.maybe_instantiate env e t)
in (match (_339509) with
| (e, t, implicits) -> begin
(let tc = if (Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str) then begin
Support.Microsoft.FStar.Util.Inl (t)
end else begin
Support.Microsoft.FStar.Util.Inr ((Microsoft_FStar_Tc_Util.lcomp_of_comp (Microsoft_FStar_Absyn_Syntax.mk_Total t)))
end
in ((with_implicits implicits) (value_check_expected_typ env e tc)))
end))))
end
| Microsoft_FStar_Absyn_Syntax.Exp_fvar ((v, dc)) -> begin
(let t = (Microsoft_FStar_Tc_Env.lookup_lid env v.Microsoft_FStar_Absyn_Syntax.v)
in (let e = (Microsoft_FStar_Absyn_Syntax.mk_Exp_fvar ((let _339516 = v
in {Microsoft_FStar_Absyn_Syntax.v = _339516.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = t; Microsoft_FStar_Absyn_Syntax.p = _339516.Microsoft_FStar_Absyn_Syntax.p}), dc) (Some (t)) e.Microsoft_FStar_Absyn_Syntax.pos)
in (let _339522 = (Microsoft_FStar_Tc_Util.maybe_instantiate env e t)
in (match (_339522) with
| (e, t, implicits) -> begin
(let tc = if (Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str) then begin
Support.Microsoft.FStar.Util.Inl (t)
end else begin
Support.Microsoft.FStar.Util.Inr ((Microsoft_FStar_Tc_Util.lcomp_of_comp (Microsoft_FStar_Absyn_Syntax.mk_Total t)))
end
in if (dc && (not ((Microsoft_FStar_Tc_Env.is_datacon env v.Microsoft_FStar_Absyn_Syntax.v)))) then begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Support.Microsoft.FStar.Util.format1 "Expected a data constructor; got %s" v.Microsoft_FStar_Absyn_Syntax.v.Microsoft_FStar_Absyn_Syntax.str), (Microsoft_FStar_Tc_Env.get_range env)))))
end else begin
((with_implicits implicits) (value_check_expected_typ env e tc))
end)
end))))
end
| Microsoft_FStar_Absyn_Syntax.Exp_constant (c) -> begin
(let t = (Microsoft_FStar_Tc_Recheck.typing_const e.Microsoft_FStar_Absyn_Syntax.pos c)
in (let e = (Microsoft_FStar_Absyn_Syntax.mk_Exp_constant c (Some (t)) e.Microsoft_FStar_Absyn_Syntax.pos)
in (value_check_expected_typ env e (Support.Microsoft.FStar.Util.Inl (t)))))
end
| Microsoft_FStar_Absyn_Syntax.Exp_abs ((bs, body)) -> begin
(let fail = (fun msg t -> (raise (Microsoft_FStar_Absyn_Syntax.Error (((Microsoft_FStar_Tc_Errors.expected_a_term_of_type_t_got_a_function env msg t top), top.Microsoft_FStar_Absyn_Syntax.pos)))))
in (let rec expected_function_typ = (fun env t0 -> (match (t0) with
| None -> begin
(let _339543 = (match (env.Microsoft_FStar_Tc_Env.letrecs) with
| [] -> begin
()
end
| _ -> begin
(failwith ("Impossible"))
end)
in (let _339548 = (tc_binders env bs)
in (match (_339548) with
| (bs, envbody, g) -> begin
(None, bs, [], None, envbody, g)
end)))
end
| Some (t) -> begin
(let t = (Microsoft_FStar_Absyn_Util.compress_typ t)
in (let rec as_function_typ = (fun norm t -> (match ((Microsoft_FStar_Absyn_Util.compress_typ t).Microsoft_FStar_Absyn_Syntax.n) with
| (Microsoft_FStar_Absyn_Syntax.Typ_uvar (_)) | (Microsoft_FStar_Absyn_Syntax.Typ_app (({Microsoft_FStar_Absyn_Syntax.n = Microsoft_FStar_Absyn_Syntax.Typ_uvar (_); Microsoft_FStar_Absyn_Syntax.tk = _; Microsoft_FStar_Absyn_Syntax.pos = _; Microsoft_FStar_Absyn_Syntax.fvs = _; Microsoft_FStar_Absyn_Syntax.uvs = _}, _))) -> begin
(let _339577 = (match (env.Microsoft_FStar_Tc_Env.letrecs) with
| [] -> begin
()
end
| _ -> begin
(failwith ("Impossible"))
end)
in (let _339582 = (tc_binders env bs)
in (match (_339582) with
| (bs, envbody, g) -> begin
(let _339586 = (Microsoft_FStar_Tc_Env.clear_expected_typ envbody)
in (match (_339586) with
| (envbody, _) -> begin
(Some (t), bs, [], None, envbody, g)
end))
end)))
end
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((bs', c)) -> begin
(let rec tc_binders = (fun _339596 bs_annot c bs -> (match (_339596) with
| (out, env, g, subst) -> begin
(match ((bs_annot, bs)) with
| ([], []) -> begin
((Support.List.rev out), env, g, (Microsoft_FStar_Absyn_Util.subst_comp subst c))
end
| (hdannot::tl_annot, hd::tl) -> begin
(match ((hdannot, hd)) with
| ((Support.Microsoft.FStar.Util.Inl (_), _), (Support.Microsoft.FStar.Util.Inr (_), _)) -> begin
(let env = (maybe_push_binding env hdannot)
in (tc_binders ((hdannot)::out, env, g, subst) tl_annot c bs))
end
| ((Support.Microsoft.FStar.Util.Inl (a), _), (Support.Microsoft.FStar.Util.Inl (b), imp)) -> begin
(let ka = (Microsoft_FStar_Absyn_Util.subst_kind subst a.Microsoft_FStar_Absyn_Syntax.sort)
in (let _339645 = (match (b.Microsoft_FStar_Absyn_Syntax.sort.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Kind_unknown -> begin
(ka, Microsoft_FStar_Tc_Rel.trivial_guard)
end
| _ -> begin
(let _339640 = (tc_kind env b.Microsoft_FStar_Absyn_Syntax.sort)
in (match (_339640) with
| (k, g1) -> begin
(let g2 = (Microsoft_FStar_Tc_Rel.keq env None ka k)
in (let g = (Microsoft_FStar_Tc_Rel.conj_guard g (Microsoft_FStar_Tc_Rel.conj_guard g1 g2))
in (k, g)))
end))
end)
in (match (_339645) with
| (k, g) -> begin
(let b = (Support.Microsoft.FStar.Util.Inl ((let _339646 = b
in {Microsoft_FStar_Absyn_Syntax.v = _339646.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = k; Microsoft_FStar_Absyn_Syntax.p = _339646.Microsoft_FStar_Absyn_Syntax.p})), imp)
in (let env = (maybe_push_binding env b)
in (let subst = (maybe_alpha_subst subst hdannot b)
in (tc_binders ((b)::out, env, g, subst) tl_annot c tl))))
end)))
end
| ((Support.Microsoft.FStar.Util.Inr (x), _), (Support.Microsoft.FStar.Util.Inr (y), imp)) -> begin
(let tx = (Microsoft_FStar_Absyn_Util.subst_typ subst x.Microsoft_FStar_Absyn_Syntax.sort)
in (let _339676 = (match ((Microsoft_FStar_Absyn_Util.unmeta_typ y.Microsoft_FStar_Absyn_Syntax.sort).Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_unknown -> begin
(tx, g)
end
| _ -> begin
(let _339665 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint1 "Checking binder %s\n" (Microsoft_FStar_Absyn_Print.binder_to_string hd))
end
in (let _339671 = (tc_typ env y.Microsoft_FStar_Absyn_Syntax.sort)
in (match (_339671) with
| (t, _, g1) -> begin
(let g2 = (Microsoft_FStar_Tc_Rel.teq env tx t)
in (let g = (Microsoft_FStar_Tc_Rel.conj_guard g (Microsoft_FStar_Tc_Rel.conj_guard g1 g2))
in (t, g)))
end)))
end)
in (match (_339676) with
| (t, g) -> begin
(let b = (Support.Microsoft.FStar.Util.Inr ((let _339677 = y
in {Microsoft_FStar_Absyn_Syntax.v = _339677.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = t; Microsoft_FStar_Absyn_Syntax.p = _339677.Microsoft_FStar_Absyn_Syntax.p})), imp)
in (let env = (maybe_push_binding env b)
in (let subst = (maybe_alpha_subst subst hdannot b)
in (tc_binders ((b)::out, env, g, subst) tl_annot c tl))))
end)))
end
| _ -> begin
(fail (Support.Microsoft.FStar.Util.format2 "Annotated %s; given %s" (Microsoft_FStar_Absyn_Print.binder_to_string hdannot) (Microsoft_FStar_Absyn_Print.binder_to_string hd)) t)
end)
end
| ([], _) -> begin
if (Microsoft_FStar_Absyn_Util.is_total_comp c) then begin
(match (((whnf env) (Microsoft_FStar_Absyn_Util.comp_result c))) with
| {Microsoft_FStar_Absyn_Syntax.n = Microsoft_FStar_Absyn_Syntax.Typ_fun ((bs_annot, c')); Microsoft_FStar_Absyn_Syntax.tk = _; Microsoft_FStar_Absyn_Syntax.pos = _; Microsoft_FStar_Absyn_Syntax.fvs = _; Microsoft_FStar_Absyn_Syntax.uvs = _} -> begin
(tc_binders (out, env, g, subst) bs_annot c' bs)
end
| t -> begin
(fail (Support.Microsoft.FStar.Util.format1 "More arguments than annotated type \x28%s\x29" (Microsoft_FStar_Absyn_Print.tag_of_typ t)) t)
end)
end else begin
(fail "Curried function, but not total" t)
end
end
| (_, []) -> begin
(let c = (Microsoft_FStar_Absyn_Util.total_comp (Microsoft_FStar_Absyn_Syntax.mk_Typ_fun (bs_annot, c) (Some (Microsoft_FStar_Absyn_Syntax.ktype)) c.Microsoft_FStar_Absyn_Syntax.pos) c.Microsoft_FStar_Absyn_Syntax.pos)
in ((Support.List.rev out), env, g, (Microsoft_FStar_Absyn_Util.subst_comp subst c)))
end)
end))
in (let mk_letrec_environment = (fun actuals env -> (match (env.Microsoft_FStar_Tc_Env.letrecs) with
| [] -> begin
(env, [])
end
| letrecs -> begin
(let _339712 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint1 "Building let-rec environment... type of this abstraction is %s\n" (Microsoft_FStar_Absyn_Print.typ_to_string t))
end
in (let r = (Microsoft_FStar_Tc_Env.get_range env)
in (let env = (let _339715 = env
in {Microsoft_FStar_Tc_Env.solver = _339715.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _339715.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _339715.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _339715.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _339715.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _339715.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _339715.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _339715.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _339715.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _339715.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _339715.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _339715.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _339715.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = []; Microsoft_FStar_Tc_Env.top_level = _339715.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _339715.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = _339715.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = _339715.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _339715.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _339715.Microsoft_FStar_Tc_Env.default_effects})
in (let filter_types_and_functions = (fun bs -> ((Support.List.collect (fun b -> (match (b) with
| (Support.Microsoft.FStar.Util.Inl (_), _) -> begin
[]
end
| (Support.Microsoft.FStar.Util.Inr (x), _) -> begin
(match ((Microsoft_FStar_Absyn_Util.unrefine (whnf env (Microsoft_FStar_Absyn_Util.unrefine x.Microsoft_FStar_Absyn_Syntax.sort))).Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_fun (_) -> begin
[]
end
| _ -> begin
((Microsoft_FStar_Absyn_Util.bvar_to_exp x))::[]
end)
end))) bs))
in (let precedes = (Microsoft_FStar_Absyn_Util.ftv Microsoft_FStar_Absyn_Const.precedes_lid Microsoft_FStar_Absyn_Syntax.kun)
in (let as_lex_list = (fun dec -> (let _339743 = (Microsoft_FStar_Absyn_Util.head_and_args_e dec)
in (match (_339743) with
| (head, _) -> begin
(match (head.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Exp_fvar ((fv, _)) when (Microsoft_FStar_Absyn_Syntax.lid_equals fv.Microsoft_FStar_Absyn_Syntax.v Microsoft_FStar_Absyn_Const.lexcons_lid) -> begin
dec
end
| _ -> begin
(mk_lex_list ((dec)::[]))
end)
end)))
in (let prev_dec = (let ct = (Microsoft_FStar_Absyn_Util.comp_to_comp_typ c)
in (match (((Support.List.tryFind (fun _338604 -> (match (_338604) with
| Microsoft_FStar_Absyn_Syntax.DECREASES (_) -> begin
true
end
| _ -> begin
false
end))) ct.Microsoft_FStar_Absyn_Syntax.flags)) with
| Some (Microsoft_FStar_Absyn_Syntax.DECREASES (dec)) -> begin
(let _339755 = if ((Support.List.length bs') <> (Support.List.length actuals)) then begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Support.Microsoft.FStar.Util.format2 "Decreases clause on a function with an unexpected number of arguments \x28expected %s; got %s\x29" (Support.Microsoft.FStar.Util.string_of_int (Support.List.length bs')) (Support.Microsoft.FStar.Util.string_of_int (Support.List.length actuals))), (Microsoft_FStar_Tc_Env.get_range env)))))
end
in (let dec = (as_lex_list dec)
in (let subst = (Support.List.map2 (fun b a -> (match ((b, a)) with
| ((Support.Microsoft.FStar.Util.Inl (formal), _), (Support.Microsoft.FStar.Util.Inl (actual), _)) -> begin
Support.Microsoft.FStar.Util.Inl ((formal.Microsoft_FStar_Absyn_Syntax.v, (Microsoft_FStar_Absyn_Util.btvar_to_typ actual)))
end
| ((Support.Microsoft.FStar.Util.Inr (formal), _), (Support.Microsoft.FStar.Util.Inr (actual), _)) -> begin
Support.Microsoft.FStar.Util.Inr ((formal.Microsoft_FStar_Absyn_Syntax.v, (Microsoft_FStar_Absyn_Util.bvar_to_exp actual)))
end
| _ -> begin
(failwith ("impossible"))
end)) bs' actuals)
in (Microsoft_FStar_Absyn_Util.subst_exp subst dec))))
end
| _ -> begin
(let actual_args = (filter_types_and_functions actuals)
in (match (actual_args) with
| i::[] -> begin
i
end
| _ -> begin
(mk_lex_list actual_args)
end))
end))
in (let letrecs = ((Support.List.map (fun _339801 -> (match (_339801) with
| (l, t0) -> begin
(let t = (Microsoft_FStar_Absyn_Util.alpha_typ t0)
in (match ((Microsoft_FStar_Absyn_Util.compress_typ t).Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((formals, c)) -> begin
(match ((Support.Microsoft.FStar.Util.prefix formals)) with
| (bs, (Support.Microsoft.FStar.Util.Inr (x), imp)) -> begin
(let y = (Microsoft_FStar_Absyn_Util.gen_bvar_p x.Microsoft_FStar_Absyn_Syntax.p x.Microsoft_FStar_Absyn_Syntax.sort)
in (let ct = (Microsoft_FStar_Absyn_Util.comp_to_comp_typ c)
in (let precedes = (match (((Support.List.tryFind (fun _338605 -> (match (_338605) with
| Microsoft_FStar_Absyn_Syntax.DECREASES (_) -> begin
true
end
| _ -> begin
false
end))) ct.Microsoft_FStar_Absyn_Syntax.flags)) with
| Some (Microsoft_FStar_Absyn_Syntax.DECREASES (dec)) -> begin
(let dec = (as_lex_list dec)
in (let dec = (let subst = (Support.Microsoft.FStar.Util.Inr ((x.Microsoft_FStar_Absyn_Syntax.v, (Microsoft_FStar_Absyn_Util.bvar_to_exp y))))::[]
in (Microsoft_FStar_Absyn_Util.subst_exp subst dec))
in (Microsoft_FStar_Absyn_Syntax.mk_Typ_app (precedes, ((Microsoft_FStar_Absyn_Syntax.varg dec))::((Microsoft_FStar_Absyn_Syntax.varg prev_dec))::[]) None r)))
end
| _ -> begin
(let formal_args = (filter_types_and_functions (Support.List.append bs (((Microsoft_FStar_Absyn_Syntax.v_binder y))::[])))
in (let lhs = (match (formal_args) with
| i::[] -> begin
i
end
| _ -> begin
(mk_lex_list formal_args)
end)
in (Microsoft_FStar_Absyn_Syntax.mk_Typ_app (precedes, ((Microsoft_FStar_Absyn_Syntax.varg lhs))::((Microsoft_FStar_Absyn_Syntax.varg prev_dec))::[]) None r)))
end)
in (let refined_domain = (Microsoft_FStar_Absyn_Syntax.mk_Typ_refine (y, precedes) None r)
in (let bs = (Support.List.append bs (((Support.Microsoft.FStar.Util.Inr ((let _339837 = x
in {Microsoft_FStar_Absyn_Syntax.v = _339837.Microsoft_FStar_Absyn_Syntax.v; Microsoft_FStar_Absyn_Syntax.sort = refined_domain; Microsoft_FStar_Absyn_Syntax.p = _339837.Microsoft_FStar_Absyn_Syntax.p})), imp))::[]))
in (let t' = (Microsoft_FStar_Absyn_Syntax.mk_Typ_fun (bs, c) None r)
in (let _339841 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint3 "Refined let rec %s\n\tfrom type %s\n\tto type %s\n" (Microsoft_FStar_Absyn_Print.lbname_to_string l) (Microsoft_FStar_Absyn_Print.typ_to_string t) (Microsoft_FStar_Absyn_Print.typ_to_string t'))
end
in (let _339848 = (tc_typ ((Support.Prims.fst) (Microsoft_FStar_Tc_Env.clear_expected_typ env)) t')
in (match (_339848) with
| (t', _, _) -> begin
(l, t')
end)))))))))
end
| _ -> begin
(failwith ("Impossible"))
end)
end
| _ -> begin
(failwith ("Impossible"))
end))
end))) letrecs)
in (((Support.List.fold_left (fun env _339857 -> (match (_339857) with
| (x, t) -> begin
(Microsoft_FStar_Tc_Env.push_local_binding env (binding_of_lb x t))
end)) env) letrecs), ((Support.List.collect (fun _338606 -> (match (_338606) with
| (Support.Microsoft.FStar.Util.Inl (x), t) -> begin
((Microsoft_FStar_Absyn_Syntax.v_binder (Microsoft_FStar_Absyn_Util.bvd_to_bvar_s x t)))::[]
end
| _ -> begin
[]
end))) letrecs))))))))))
end))
in (let _339869 = (tc_binders ([], env, Microsoft_FStar_Tc_Rel.trivial_guard, []) bs' c bs)
in (match (_339869) with
| (bs, envbody, g, c) -> begin
(let _339872 = if (Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str) then begin
(mk_letrec_environment bs envbody)
end else begin
(envbody, [])
end
in (match (_339872) with
| (envbody, letrecs) -> begin
(let envbody = (Microsoft_FStar_Tc_Env.set_expected_typ envbody (Microsoft_FStar_Absyn_Util.comp_result c))
in (Some (t), bs, letrecs, Some (c), envbody, g))
end))
end))))
end
| Microsoft_FStar_Absyn_Syntax.Typ_refine ((b, _)) -> begin
(as_function_typ norm b.Microsoft_FStar_Absyn_Syntax.sort)
end
| _ -> begin
if (not (norm)) then begin
(as_function_typ true (whnf env t))
end else begin
(let _339889 = (expected_function_typ env None)
in (match (_339889) with
| (_, bs, _, c_opt, envbody, g) -> begin
(Some (t), bs, [], c_opt, envbody, g)
end))
end
end))
in (as_function_typ false t)))
end))
in (let _339892 = (Microsoft_FStar_Tc_Env.clear_expected_typ env)
in (match (_339892) with
| (env, topt) -> begin
(let _339899 = (expected_function_typ env topt)
in (match (_339899) with
| (tfun_opt, bs, letrec_binders, c_opt, envbody, g) -> begin
(let _339905 = (tc_exp (let _339900 = envbody
in {Microsoft_FStar_Tc_Env.solver = _339900.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _339900.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _339900.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _339900.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _339900.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _339900.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _339900.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _339900.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _339900.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _339900.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _339900.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _339900.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _339900.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _339900.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = false; Microsoft_FStar_Tc_Env.check_uvars = _339900.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = _339900.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = _339900.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _339900.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _339900.Microsoft_FStar_Tc_Env.default_effects}) body)
in (match (_339905) with
| (body, cbody, guard_body) -> begin
(let _339906 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Medium) then begin
(Support.Microsoft.FStar.Util.fprint3 "!!!!!!!!!!!!!!!body %s has type %s\nguard is %s\n" (Microsoft_FStar_Absyn_Print.exp_to_string body) (Microsoft_FStar_Absyn_Print.lcomp_typ_to_string cbody) (Microsoft_FStar_Tc_Rel.guard_to_string env guard_body))
end
in (let guard_body = (Microsoft_FStar_Tc_Rel.solve_deferred_constraints envbody guard_body)
in (let _339909 = if ((Microsoft_FStar_Tc_Env.debug env) (Microsoft_FStar_Options.Other ("Implicits"))) then begin
(Support.Microsoft.FStar.Util.fprint1 "Introduced %s implicits in body of abstraction\n" (Support.Microsoft.FStar.Util.string_of_int (Support.List.length guard_body.Microsoft_FStar_Tc_Rel.implicits)))
end
in (let _339914 = (check_expected_effect envbody c_opt (body, (cbody.Microsoft_FStar_Absyn_Syntax.comp ())))
in (match (_339914) with
| (body, cbody, guard) -> begin
(let guard = (Microsoft_FStar_Tc_Rel.conj_guard guard_body guard)
in (let guard = if (env.Microsoft_FStar_Tc_Env.top_level || (not ((Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str)))) then begin
(let _339917 = (Microsoft_FStar_Tc_Util.discharge_guard envbody (Microsoft_FStar_Tc_Rel.conj_guard g guard))
in (let _339919 = Microsoft_FStar_Tc_Rel.trivial_guard
in {Microsoft_FStar_Tc_Rel.guard_f = _339919.Microsoft_FStar_Tc_Rel.guard_f; Microsoft_FStar_Tc_Rel.deferred = _339919.Microsoft_FStar_Tc_Rel.deferred; Microsoft_FStar_Tc_Rel.implicits = guard.Microsoft_FStar_Tc_Rel.implicits}))
end else begin
(let guard = (Microsoft_FStar_Tc_Rel.close_guard (Support.List.append bs letrec_binders) guard)
in (Microsoft_FStar_Tc_Rel.conj_guard g guard))
end
in (let _339937 = (match (tfun_opt) with
| Some (t) -> begin
(let t = (Microsoft_FStar_Absyn_Util.compress_typ t)
in (match (t.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_fun (_) -> begin
(t, guard)
end
| _ -> begin
(let t' = (Microsoft_FStar_Absyn_Syntax.mk_Typ_fun (bs, cbody) (Some (Microsoft_FStar_Absyn_Syntax.ktype)) top.Microsoft_FStar_Absyn_Syntax.pos)
in (let _339931 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint2 "Adding an additional equality constraint between\nannotated type %s\nand\ncomputed type %s\n" (Microsoft_FStar_Absyn_Print.typ_to_string t) (Microsoft_FStar_Absyn_Print.typ_to_string t'))
end
in (let guard' = (Microsoft_FStar_Tc_Rel.teq env t t')
in (t', (Microsoft_FStar_Tc_Rel.conj_guard guard guard')))))
end))
end
| None -> begin
((Microsoft_FStar_Absyn_Syntax.mk_Typ_fun (bs, cbody) (Some (Microsoft_FStar_Absyn_Syntax.ktype)) top.Microsoft_FStar_Absyn_Syntax.pos), guard)
end)
in (match (_339937) with
| (tfun, guard) -> begin
(let _339938 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint3 "!!!!!!!!!!!!!!!Annotating lambda with type %s \x28%s\x29\nGuard is %s\n" (Microsoft_FStar_Absyn_Print.typ_to_string tfun) (Microsoft_FStar_Absyn_Print.tag_of_typ tfun) (Microsoft_FStar_Tc_Rel.guard_to_string env guard))
end
in (let e = (Microsoft_FStar_Absyn_Syntax.mk_Exp_abs (bs, body) (Some (tfun)) e.Microsoft_FStar_Absyn_Syntax.pos)
in (let e = (Microsoft_FStar_Absyn_Syntax.mk_Exp_ascribed (e, tfun) e.Microsoft_FStar_Absyn_Syntax.pos)
in (let c = if env.Microsoft_FStar_Tc_Env.top_level then begin
(Microsoft_FStar_Absyn_Syntax.mk_Total tfun)
end else begin
(Microsoft_FStar_Tc_Util.return_value env tfun e)
end
in (let _339945 = (Microsoft_FStar_Tc_Util.strengthen_precondition None env e (Microsoft_FStar_Tc_Util.lcomp_of_comp c) guard)
in (match (_339945) with
| (c, g) -> begin
(e, c, g)
end))))))
end))))
end)))))
end))
end))
end))))
end
| _ -> begin
(failwith ((Support.Microsoft.FStar.Util.format1 "Unexpected value: %s" (Microsoft_FStar_Absyn_Print.exp_to_string e))))
end))))
and tc_exp = (fun env e -> (let env = if (e.Microsoft_FStar_Absyn_Syntax.pos = Microsoft_FStar_Absyn_Syntax.dummyRange) then begin
env
end else begin
(Microsoft_FStar_Tc_Env.set_range env e.Microsoft_FStar_Absyn_Syntax.pos)
end
in (let _339951 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint2 "%s \x28%s\x29\n" (Support.Microsoft.FStar.Range.string_of_range (Microsoft_FStar_Tc_Env.get_range env)) (Microsoft_FStar_Absyn_Print.tag_of_exp e))
end
in (let w = (fun lc -> ((Microsoft_FStar_Absyn_Syntax.syn e.Microsoft_FStar_Absyn_Syntax.pos) (Some (lc.Microsoft_FStar_Absyn_Syntax.res_typ))))
in (let top = e
in (match (e.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Exp_delayed (_) -> begin
(tc_exp env (Microsoft_FStar_Absyn_Util.compress_exp e))
end
| (Microsoft_FStar_Absyn_Syntax.Exp_uvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_bvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_fvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_constant (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_abs (_)) -> begin
(tc_value env e)
end
| Microsoft_FStar_Absyn_Syntax.Exp_ascribed ((e1, t1)) -> begin
(let _339980 = (tc_typ_check env t1 Microsoft_FStar_Absyn_Syntax.ktype)
in (match (_339980) with
| (t1, f) -> begin
(let _339984 = (tc_exp (Microsoft_FStar_Tc_Env.set_expected_typ env t1) e1)
in (match (_339984) with
| (e1, c, g) -> begin
(let _339988 = (Microsoft_FStar_Tc_Util.strengthen_precondition (Some ((fun _339985 -> (match (_339985) with
| () -> begin
Microsoft_FStar_Tc_Errors.ill_kinded_type
end)))) (Microsoft_FStar_Tc_Env.set_range env t1.Microsoft_FStar_Absyn_Syntax.pos) e1 c f)
in (match (_339988) with
| (c, f) -> begin
(let _339992 = (comp_check_expected_typ env ((w c) (Microsoft_FStar_Absyn_Syntax.mk_Exp_ascribed' (e1, t1))) c)
in (match (_339992) with
| (e, c, f2) -> begin
(e, c, (Microsoft_FStar_Tc_Rel.conj_guard f (Microsoft_FStar_Tc_Rel.conj_guard g f2)))
end))
end))
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Exp_meta (Microsoft_FStar_Absyn_Syntax.Meta_desugared ((e, Microsoft_FStar_Absyn_Syntax.Sequence))) -> begin
(match ((Microsoft_FStar_Absyn_Util.compress_exp e).Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Exp_let (((_, (x, _, e1)::[]), e2)) -> begin
(let _340013 = (tc_exp (Microsoft_FStar_Tc_Env.set_expected_typ env Microsoft_FStar_Tc_Recheck.t_unit) e1)
in (match (_340013) with
| (e1, c1, g1) -> begin
(let _340017 = (tc_exp env e2)
in (match (_340017) with
| (e2, c2, g2) -> begin
(let c = (Microsoft_FStar_Tc_Util.bind env (Some (e1)) c1 (None, c2))
in ((Microsoft_FStar_Absyn_Syntax.mk_Exp_meta (Microsoft_FStar_Absyn_Syntax.Meta_desugared ((((w c) (Microsoft_FStar_Absyn_Syntax.mk_Exp_let ((false, ((x, Microsoft_FStar_Tc_Recheck.t_unit, e1))::[]), e2))), Microsoft_FStar_Absyn_Syntax.Sequence)))), c, (Microsoft_FStar_Tc_Rel.conj_guard g1 g2)))
end))
end))
end
| _ -> begin
(let _340024 = (tc_exp env e)
in (match (_340024) with
| (e, c, g) -> begin
((Microsoft_FStar_Absyn_Syntax.mk_Exp_meta (Microsoft_FStar_Absyn_Syntax.Meta_desugared ((e, Microsoft_FStar_Absyn_Syntax.Sequence)))), c, g)
end))
end)
end
| Microsoft_FStar_Absyn_Syntax.Exp_meta (Microsoft_FStar_Absyn_Syntax.Meta_desugared ((e, i))) -> begin
(let _340033 = (tc_exp env e)
in (match (_340033) with
| (e, c, g) -> begin
((Microsoft_FStar_Absyn_Syntax.mk_Exp_meta (Microsoft_FStar_Absyn_Syntax.Meta_desugared ((e, i)))), c, g)
end))
end
| Microsoft_FStar_Absyn_Syntax.Exp_app ((head, args)) -> begin
(let env0 = env
in (let env = (instantiate_both ((Support.Prims.fst) (Microsoft_FStar_Tc_Env.clear_expected_typ env)))
in (let _340040 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "\x28%s\x29 Checking app %s\n" (Support.Microsoft.FStar.Range.string_of_range top.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.exp_to_string top))
end
in (let _340045 = (tc_exp (no_inst env) head)
in (match (_340045) with
| (head, chead, g_head) -> begin
(let aux = (fun _340047 -> (match (_340047) with
| () -> begin
(let n_args = (Support.List.length args)
in (match (head.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Exp_fvar ((fv, _)) when (((Microsoft_FStar_Absyn_Syntax.lid_equals fv.Microsoft_FStar_Absyn_Syntax.v Microsoft_FStar_Absyn_Const.op_And) || (Microsoft_FStar_Absyn_Syntax.lid_equals fv.Microsoft_FStar_Absyn_Syntax.v Microsoft_FStar_Absyn_Const.op_Or)) && (n_args = 2)) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_expected_typ env Microsoft_FStar_Absyn_Util.t_bool)
in (match (args) with
| (Support.Microsoft.FStar.Util.Inr (e1), _)::(Support.Microsoft.FStar.Util.Inr (e2), _)::[] -> begin
(let _340069 = (tc_exp env e1)
in (match (_340069) with
| (e1, c1, g1) -> begin
(let _340073 = (tc_exp env e2)
in (match (_340073) with
| (e2, c2, g2) -> begin
(let x = (Microsoft_FStar_Absyn_Util.gen_bvar Microsoft_FStar_Absyn_Util.t_bool)
in (let xexp = (Microsoft_FStar_Absyn_Util.bvar_to_exp x)
in (let c2 = if (Microsoft_FStar_Absyn_Syntax.lid_equals fv.Microsoft_FStar_Absyn_Syntax.v Microsoft_FStar_Absyn_Const.op_And) then begin
(Microsoft_FStar_Tc_Util.ite env (Microsoft_FStar_Absyn_Util.b2t (Microsoft_FStar_Absyn_Util.bvar_to_exp x)) c2 (Microsoft_FStar_Tc_Util.lcomp_of_comp (Microsoft_FStar_Tc_Util.return_value env Microsoft_FStar_Absyn_Util.t_bool xexp)))
end else begin
(Microsoft_FStar_Tc_Util.ite env (Microsoft_FStar_Absyn_Util.b2t (Microsoft_FStar_Absyn_Util.bvar_to_exp x)) (Microsoft_FStar_Tc_Util.lcomp_of_comp (Microsoft_FStar_Tc_Util.return_value env Microsoft_FStar_Absyn_Util.t_bool xexp)) c2)
end
in (let c = (Microsoft_FStar_Tc_Util.bind env None c1 ((Some (Microsoft_FStar_Tc_Env.Binding_var ((x.Microsoft_FStar_Absyn_Syntax.v, Microsoft_FStar_Absyn_Util.t_bool)))), c2))
in (let e = (Microsoft_FStar_Absyn_Syntax.mk_Exp_app (head, ((Microsoft_FStar_Absyn_Syntax.varg e1))::((Microsoft_FStar_Absyn_Syntax.varg e2))::[]) (Some (Microsoft_FStar_Absyn_Util.t_bool)) top.Microsoft_FStar_Absyn_Syntax.pos)
in (e, c, (Microsoft_FStar_Tc_Rel.conj_guard g_head (Microsoft_FStar_Tc_Rel.conj_guard g1 g2))))))))
end))
end))
end
| _ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Expected two boolean arguments", head.Microsoft_FStar_Absyn_Syntax.pos))))
end))
end
| _ -> begin
(let thead = chead.Microsoft_FStar_Absyn_Syntax.res_typ
in (let _340084 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "\x28%s\x29 Type of head is %s\n" (Support.Microsoft.FStar.Range.string_of_range head.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.typ_to_string thead))
end
in (let rec check_function_app = (fun norm tf -> (match ((Microsoft_FStar_Absyn_Util.unrefine tf).Microsoft_FStar_Absyn_Syntax.n) with
| (Microsoft_FStar_Absyn_Syntax.Typ_uvar (_)) | (Microsoft_FStar_Absyn_Syntax.Typ_app (({Microsoft_FStar_Absyn_Syntax.n = Microsoft_FStar_Absyn_Syntax.Typ_uvar (_); Microsoft_FStar_Absyn_Syntax.tk = _; Microsoft_FStar_Absyn_Syntax.pos = _; Microsoft_FStar_Absyn_Syntax.fvs = _; Microsoft_FStar_Absyn_Syntax.uvs = _}, _))) -> begin
(let rec tc_args = (fun env args -> (match (args) with
| [] -> begin
([], [], Microsoft_FStar_Tc_Rel.trivial_guard)
end
| (Support.Microsoft.FStar.Util.Inl (t), _)::_ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Explicit type applications on a term with unknown type; add an annotation?", t.Microsoft_FStar_Absyn_Syntax.pos))))
end
| (Support.Microsoft.FStar.Util.Inr (e), imp)::tl -> begin
(let _340129 = (tc_exp env e)
in (match (_340129) with
| (e, c, g_e) -> begin
(let _340133 = (tc_args env tl)
in (match (_340133) with
| (args, comps, g_rest) -> begin
(((Support.Microsoft.FStar.Util.Inr (e), imp))::args, (c)::comps, (Microsoft_FStar_Tc_Rel.conj_guard g_e g_rest))
end))
end))
end))
in (let _340137 = (tc_args env args)
in (match (_340137) with
| (args, comps, g_args) -> begin
(let bs = (Microsoft_FStar_Absyn_Util.null_binders_of_tks (Microsoft_FStar_Tc_Util.tks_of_args args))
in (let cres = (Microsoft_FStar_Absyn_Util.ml_comp (Microsoft_FStar_Tc_Util.new_tvar env Microsoft_FStar_Absyn_Syntax.ktype) top.Microsoft_FStar_Absyn_Syntax.pos)
in (let _340140 = ((Microsoft_FStar_Tc_Util.force_trivial env) (Microsoft_FStar_Tc_Rel.teq env tf (Microsoft_FStar_Absyn_Syntax.mk_Typ_fun (bs, cres) (Some (Microsoft_FStar_Absyn_Syntax.ktype)) tf.Microsoft_FStar_Absyn_Syntax.pos)))
in (let comp = (Support.List.fold_right (fun c out -> (Microsoft_FStar_Tc_Util.bind env None c (None, out))) ((chead)::comps) (Microsoft_FStar_Tc_Util.lcomp_of_comp cres))
in ((Microsoft_FStar_Absyn_Syntax.mk_Exp_app (head, args) (Some (comp.Microsoft_FStar_Absyn_Syntax.res_typ)) top.Microsoft_FStar_Absyn_Syntax.pos), comp, (Microsoft_FStar_Tc_Rel.conj_guard g_head g_args))))))
end)))
end
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((bs, c)) -> begin
(let vars = (Microsoft_FStar_Tc_Env.binders env)
in (let rec tc_args = (fun _340157 bs cres args -> (match (_340157) with
| (subst, outargs, arg_rets, comps, g, fvs) -> begin
(match ((bs, args)) with
| ((Support.Microsoft.FStar.Util.Inl (a), Some (Microsoft_FStar_Absyn_Syntax.Implicit))::rest, (_, None)::_) -> begin
(let k = (Microsoft_FStar_Absyn_Util.subst_kind subst a.Microsoft_FStar_Absyn_Syntax.sort)
in (let _340177 = (fxv_check head env (Support.Microsoft.FStar.Util.Inl (k)) fvs)
in (let _340181 = (Microsoft_FStar_Tc_Rel.new_tvar (Microsoft_FStar_Absyn_Util.range_of_arg (Support.List.hd args)) vars k)
in (match (_340181) with
| (targ, u) -> begin
(let _340182 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Extreme) then begin
(Support.Microsoft.FStar.Util.fprint2 "Instantiating %s to %s" (Microsoft_FStar_Absyn_Print.strBvd a.Microsoft_FStar_Absyn_Syntax.v) (Microsoft_FStar_Absyn_Print.typ_to_string targ))
end
in (let subst = (Support.Microsoft.FStar.Util.Inl ((a.Microsoft_FStar_Absyn_Syntax.v, targ)))::subst
in (let arg = (Support.Microsoft.FStar.Util.Inl (targ), (Microsoft_FStar_Absyn_Syntax.as_implicit true))
in (tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, (add_implicit (Support.Microsoft.FStar.Util.Inl (((Microsoft_FStar_Tc_Util.as_uvar_t u), u.Microsoft_FStar_Absyn_Syntax.pos))) g), fvs) rest cres args))))
end))))
end
| ((Support.Microsoft.FStar.Util.Inr (x), Some (Microsoft_FStar_Absyn_Syntax.Implicit))::rest, (_, None)::_) -> begin
(let t = (Microsoft_FStar_Absyn_Util.subst_typ subst x.Microsoft_FStar_Absyn_Syntax.sort)
in (let _340202 = (fxv_check head env (Support.Microsoft.FStar.Util.Inr (t)) fvs)
in (let _340206 = (Microsoft_FStar_Tc_Util.new_implicit_evar env t)
in (match (_340206) with
| (varg, u) -> begin
(let subst = (Support.Microsoft.FStar.Util.Inr ((x.Microsoft_FStar_Absyn_Syntax.v, varg)))::subst
in (let arg = (Support.Microsoft.FStar.Util.Inr (varg), (Microsoft_FStar_Absyn_Syntax.as_implicit true))
in (tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, (add_implicit (Support.Microsoft.FStar.Util.Inr (u)) g), fvs) rest cres args)))
end))))
end
| ((Support.Microsoft.FStar.Util.Inl (a), aqual)::rest, (Support.Microsoft.FStar.Util.Inl (t), aq)::rest') -> begin
(let _340222 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Extreme) then begin
(Support.Microsoft.FStar.Util.fprint2 "\tGot a type arg for %s = %s\n" (Microsoft_FStar_Absyn_Print.strBvd a.Microsoft_FStar_Absyn_Syntax.v) (Microsoft_FStar_Absyn_Print.typ_to_string t))
end
in (let k = (Microsoft_FStar_Absyn_Util.subst_kind subst a.Microsoft_FStar_Absyn_Syntax.sort)
in (let _340225 = (fxv_check head env (Support.Microsoft.FStar.Util.Inl (k)) fvs)
in (let _340231 = (tc_typ_check (let _340227 = env
in {Microsoft_FStar_Tc_Env.solver = _340227.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _340227.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _340227.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _340227.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _340227.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _340227.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _340227.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _340227.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _340227.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _340227.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _340227.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _340227.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _340227.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _340227.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _340227.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _340227.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = (is_eq aqual); Microsoft_FStar_Tc_Env.is_iface = _340227.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _340227.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _340227.Microsoft_FStar_Tc_Env.default_effects}) t k)
in (match (_340231) with
| (t, g') -> begin
(let f = (Microsoft_FStar_Tc_Util.label_guard Microsoft_FStar_Tc_Errors.ill_kinded_type t.Microsoft_FStar_Absyn_Syntax.pos (Microsoft_FStar_Tc_Rel.guard_f g'))
in (let g' = (let _340233 = g'
in {Microsoft_FStar_Tc_Rel.guard_f = f; Microsoft_FStar_Tc_Rel.deferred = _340233.Microsoft_FStar_Tc_Rel.deferred; Microsoft_FStar_Tc_Rel.implicits = _340233.Microsoft_FStar_Tc_Rel.implicits})
in (let arg = (Support.Microsoft.FStar.Util.Inl (t), aq)
in (let subst = (maybe_extend_subst subst (Support.List.hd bs) arg)
in (tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, (Microsoft_FStar_Tc_Rel.conj_guard g g'), fvs) rest cres rest')))))
end)))))
end
| ((Support.Microsoft.FStar.Util.Inr (x), aqual)::rest, (Support.Microsoft.FStar.Util.Inr (e), aq)::rest') -> begin
(let _340251 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Extreme) then begin
(Support.Microsoft.FStar.Util.fprint2 "\tType of arg \x28before subst \x28%s\x29\x29 = %s\n" (Microsoft_FStar_Absyn_Print.subst_to_string subst) (Microsoft_FStar_Absyn_Print.typ_to_string x.Microsoft_FStar_Absyn_Syntax.sort))
end
in (let targ = (Microsoft_FStar_Absyn_Util.subst_typ subst x.Microsoft_FStar_Absyn_Syntax.sort)
in (let _340254 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Extreme) then begin
(Support.Microsoft.FStar.Util.fprint1 "\tType of arg \x28after subst\x29 = %s\n" (Microsoft_FStar_Absyn_Print.typ_to_string targ))
end
in (let _340256 = (fxv_check head env (Support.Microsoft.FStar.Util.Inr (targ)) fvs)
in (let env = (Microsoft_FStar_Tc_Env.set_expected_typ env targ)
in (let env = (let _340259 = env
in {Microsoft_FStar_Tc_Env.solver = _340259.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _340259.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _340259.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _340259.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _340259.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _340259.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _340259.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _340259.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _340259.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _340259.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _340259.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _340259.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _340259.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _340259.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _340259.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _340259.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = (is_eq aqual); Microsoft_FStar_Tc_Env.is_iface = _340259.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _340259.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _340259.Microsoft_FStar_Tc_Env.default_effects})
in (let _340262 = if (((Microsoft_FStar_Tc_Env.debug env) (Microsoft_FStar_Options.Other ("EQ"))) && env.Microsoft_FStar_Tc_Env.use_eq) then begin
(Support.Microsoft.FStar.Util.fprint2 "Checking arg %s at type %s with an equality constraint!\n" (Microsoft_FStar_Absyn_Print.exp_to_string e) (Microsoft_FStar_Absyn_Print.typ_to_string targ))
end
in (let _340264 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint3 "Checking arg \x28%s\x29 %s at type %s\n" (Microsoft_FStar_Absyn_Print.tag_of_exp e) (Microsoft_FStar_Absyn_Print.exp_to_string e) (Microsoft_FStar_Absyn_Print.typ_to_string targ))
end
in (let _340269 = (tc_exp env e)
in (match (_340269) with
| (e, c, g_e) -> begin
(let g = (Microsoft_FStar_Tc_Rel.conj_guard g g_e)
in (let _340271 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "Guard on this arg is %s;\naccumulated guard is %s\n" (Microsoft_FStar_Tc_Rel.guard_to_string env g_e) (Microsoft_FStar_Tc_Rel.guard_to_string env g))
end
in (let arg = (Support.Microsoft.FStar.Util.Inr (e), aq)
in if (Microsoft_FStar_Absyn_Util.is_total_lcomp c) then begin
(let subst = (maybe_extend_subst subst (Support.List.hd bs) arg)
in (tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, g, fvs) rest cres rest'))
end else begin
if (Microsoft_FStar_Tc_Util.is_pure_effect env c.Microsoft_FStar_Absyn_Syntax.eff_name) then begin
(let subst = (maybe_extend_subst subst (Support.List.hd bs) arg)
in (let _340280 = (((Some (Microsoft_FStar_Tc_Env.Binding_var ((x.Microsoft_FStar_Absyn_Syntax.v, x.Microsoft_FStar_Absyn_Syntax.sort))), c))::comps, g)
in (match (_340280) with
| (comps, guard) -> begin
(tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, guard, fvs) rest cres rest')
end)))
end else begin
if (Microsoft_FStar_Absyn_Syntax.is_null_binder (Support.List.hd bs)) then begin
(let newx = (Microsoft_FStar_Absyn_Util.gen_bvar_p e.Microsoft_FStar_Absyn_Syntax.pos c.Microsoft_FStar_Absyn_Syntax.res_typ)
in (let arg' = (Microsoft_FStar_Absyn_Syntax.varg (Microsoft_FStar_Absyn_Util.bvar_to_exp newx))
in (let binding = Microsoft_FStar_Tc_Env.Binding_var ((newx.Microsoft_FStar_Absyn_Syntax.v, newx.Microsoft_FStar_Absyn_Syntax.sort))
in (tc_args (subst, (arg)::outargs, (arg')::arg_rets, ((Some (binding), c))::comps, g, fvs) rest cres rest'))))
end else begin
(tc_args (subst, (arg)::outargs, ((Microsoft_FStar_Absyn_Syntax.varg (Microsoft_FStar_Absyn_Util.bvar_to_exp x)))::arg_rets, (((Some (Microsoft_FStar_Tc_Env.Binding_var ((x.Microsoft_FStar_Absyn_Syntax.v, x.Microsoft_FStar_Absyn_Syntax.sort)))), c))::comps, g, (Support.Microsoft.FStar.Util.set_add x fvs)) rest cres rest')
end
end
end)))
end))))))))))
end
| ((Support.Microsoft.FStar.Util.Inr (_), _)::_, (Support.Microsoft.FStar.Util.Inl (_), _)::_) -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Expected an expression; got a type", (Microsoft_FStar_Absyn_Util.range_of_arg (Support.List.hd args))))))
end
| ((Support.Microsoft.FStar.Util.Inl (_), _)::_, (Support.Microsoft.FStar.Util.Inr (_), _)::_) -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Expected a type; got an expression", (Microsoft_FStar_Absyn_Util.range_of_arg (Support.List.hd args))))))
end
| (_, []) -> begin
(let _340324 = (fxv_check head env (Support.Microsoft.FStar.Util.Inr (cres.Microsoft_FStar_Absyn_Syntax.res_typ)) fvs)
in (let _340342 = (match (bs) with
| [] -> begin
(let cres = (Microsoft_FStar_Tc_Util.subst_lcomp subst cres)
in (let g = (Microsoft_FStar_Tc_Rel.conj_guard g_head g)
in (let refine_with_equality = ((Microsoft_FStar_Absyn_Util.is_pure_lcomp cres) && ((Support.Microsoft.FStar.Util.for_some (fun _340332 -> (match (_340332) with
| (_, c) -> begin
(not ((Microsoft_FStar_Absyn_Util.is_pure_lcomp c)))
end))) comps))
in (let cres = if refine_with_equality then begin
(Microsoft_FStar_Tc_Util.maybe_assume_result_eq_pure_term env (Microsoft_FStar_Absyn_Syntax.mk_Exp_app_flat (head, (Support.List.rev arg_rets)) (Some (cres.Microsoft_FStar_Absyn_Syntax.res_typ)) top.Microsoft_FStar_Absyn_Syntax.pos) cres)
end else begin
(let _340334 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint3 "Not refining result: f=%s; cres=%s; guard=%s\n" (Microsoft_FStar_Absyn_Print.exp_to_string head) (Microsoft_FStar_Absyn_Print.lcomp_typ_to_string cres) (Microsoft_FStar_Tc_Rel.guard_to_string env g))
end
in cres)
end
in ((Microsoft_FStar_Tc_Util.refresh_comp_label env false cres), g)))))
end
| _ -> begin
(let g = ((Microsoft_FStar_Tc_Rel.solve_deferred_constraints env) (Microsoft_FStar_Tc_Rel.conj_guard g_head g))
in ((Microsoft_FStar_Tc_Util.lcomp_of_comp (Microsoft_FStar_Absyn_Syntax.mk_Total ((Microsoft_FStar_Absyn_Util.subst_typ subst) (Microsoft_FStar_Absyn_Syntax.mk_Typ_fun (bs, (cres.Microsoft_FStar_Absyn_Syntax.comp ())) (Some (Microsoft_FStar_Absyn_Syntax.ktype)) top.Microsoft_FStar_Absyn_Syntax.pos)))), g))
end)
in (match (_340342) with
| (cres, g) -> begin
(let _340343 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint1 "\t Type of result cres is %s\n" (Microsoft_FStar_Absyn_Print.lcomp_typ_to_string cres))
end
in (let comp = (Support.List.fold_left (fun out c -> (Microsoft_FStar_Tc_Util.bind env None (Support.Prims.snd c) ((Support.Prims.fst c), out))) cres comps)
in (let comp = (Microsoft_FStar_Tc_Util.bind env None chead (None, comp))
in (let app = (Microsoft_FStar_Absyn_Syntax.mk_Exp_app_flat (head, (Support.List.rev outargs)) (Some (comp.Microsoft_FStar_Absyn_Syntax.res_typ)) top.Microsoft_FStar_Absyn_Syntax.pos)
in (let _340352 = (Microsoft_FStar_Tc_Util.strengthen_precondition None env app comp g)
in (match (_340352) with
| (comp, g) -> begin
(let _340353 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint2 "\t Type of app term %s is %s\n" (Microsoft_FStar_Tc_Normalize.exp_norm_to_string env app) (Microsoft_FStar_Absyn_Print.lcomp_typ_to_string comp))
end
in (app, comp, g))
end))))))
end)))
end
| ([], arg::_) -> begin
(let rec aux = (fun norm tres -> (let tres = (Microsoft_FStar_Absyn_Util.unrefine (Microsoft_FStar_Absyn_Util.compress_typ tres))
in (match (tres.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((bs, cres')) -> begin
(let _340369 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.fprint1 "%s: Warning: Potentially redundant explicit currying of a function type \n" (Support.Microsoft.FStar.Range.string_of_range tres.Microsoft_FStar_Absyn_Syntax.pos))
end
in (tc_args (subst, outargs, arg_rets, ((None, cres))::comps, g, fvs) bs (Microsoft_FStar_Tc_Util.lcomp_of_comp cres') args))
end
| _ when (not (norm)) -> begin
(aux true (whnf env tres))
end
| _ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Support.Microsoft.FStar.Util.format2 "Too many arguments to function of type %s; got %s" (Microsoft_FStar_Tc_Normalize.typ_norm_to_string env tf) (Microsoft_FStar_Absyn_Print.exp_to_string top)), (Microsoft_FStar_Absyn_Syntax.argpos arg)))))
end)))
in (aux false cres.Microsoft_FStar_Absyn_Syntax.res_typ))
end)
end))
in (tc_args ([], [], [], [], Microsoft_FStar_Tc_Rel.trivial_guard, Microsoft_FStar_Absyn_Syntax.no_fvs.Microsoft_FStar_Absyn_Syntax.fxvs) bs (Microsoft_FStar_Tc_Util.lcomp_of_comp c) args)))
end
| _ -> begin
if (not (norm)) then begin
(check_function_app true (whnf env tf))
end else begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Microsoft_FStar_Tc_Errors.expected_function_typ env tf), head.Microsoft_FStar_Absyn_Syntax.pos))))
end
end))
in (check_function_app false (Microsoft_FStar_Absyn_Util.unrefine thead)))))
end))
end))
in (let _340380 = (aux ())
in (match (_340380) with
| (e, c, g) -> begin
(let _340381 = if ((Microsoft_FStar_Tc_Env.debug env) (Microsoft_FStar_Options.Other ("Implicits"))) then begin
(Support.Microsoft.FStar.Util.fprint1 "Introduced %s implicits in application\n" (Support.Microsoft.FStar.Util.string_of_int (Support.List.length g.Microsoft_FStar_Tc_Rel.implicits)))
end
in (let c = if (((Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str) && (not ((Microsoft_FStar_Absyn_Util.is_lcomp_partial_return c)))) && (Microsoft_FStar_Absyn_Util.is_pure_lcomp c)) then begin
(Microsoft_FStar_Tc_Util.maybe_assume_result_eq_pure_term env e c)
end else begin
c
end
in (let _340388 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Extreme) then begin
(Support.Microsoft.FStar.Util.fprint3 "\x28%s\x29 About to check %s against expected typ %s\n" (Support.Microsoft.FStar.Range.string_of_range e.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.typ_to_string c.Microsoft_FStar_Absyn_Syntax.res_typ) ((fun x -> (match (x) with
| None -> begin
"None"
end
| Some (t) -> begin
(Microsoft_FStar_Absyn_Print.typ_to_string t)
end)) (Microsoft_FStar_Tc_Env.expected_typ env0)))
end
in (let _340393 = (comp_check_expected_typ env0 e c)
in (match (_340393) with
| (e, c, g') -> begin
(e, c, (Microsoft_FStar_Tc_Rel.conj_guard g g'))
end)))))
end)))
end)))))
end
| Microsoft_FStar_Absyn_Syntax.Exp_match ((e1, eqns)) -> begin
(let _340400 = (Microsoft_FStar_Tc_Env.clear_expected_typ env)
in (match (_340400) with
| (env1, topt) -> begin
(let env1 = (instantiate_both env1)
in (let _340405 = (tc_exp env1 e1)
in (match (_340405) with
| (e1, c1, g1) -> begin
(let _340412 = (match (topt) with
| Some (t) -> begin
(env, t)
end
| None -> begin
(let res_t = (Microsoft_FStar_Tc_Util.new_tvar env Microsoft_FStar_Absyn_Syntax.ktype)
in ((Microsoft_FStar_Tc_Env.set_expected_typ env res_t), res_t))
end)
in (match (_340412) with
| (env_branches, res_t) -> begin
(let guard_x = (Microsoft_FStar_Absyn_Util.new_bvd (Some e1.Microsoft_FStar_Absyn_Syntax.pos))
in (let t_eqns = ((Support.List.map (tc_eqn guard_x c1.Microsoft_FStar_Absyn_Syntax.res_typ env_branches)) eqns)
in (let _340429 = (let _340426 = (Support.List.fold_right (fun _340420 _340423 -> (match ((_340420, _340423)) with
| ((_, f, c, g), (caccum, gaccum)) -> begin
(((f, c))::caccum, (Microsoft_FStar_Tc_Rel.conj_guard g gaccum))
end)) t_eqns ([], Microsoft_FStar_Tc_Rel.trivial_guard))
in (match (_340426) with
| (cases, g) -> begin
((Microsoft_FStar_Tc_Util.bind_cases env res_t cases), g)
end))
in (match (_340429) with
| (c_branches, g_branches) -> begin
(let _340430 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Extreme) then begin
(Support.Microsoft.FStar.Util.fprint4 "\x28%s\x29 comp\n\tscrutinee: %s\n\tbranches: %s\nguard = %s\n" (Support.Microsoft.FStar.Range.string_of_range top.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.lcomp_typ_to_string c1) (Microsoft_FStar_Absyn_Print.lcomp_typ_to_string c_branches) (Microsoft_FStar_Tc_Rel.guard_to_string env g_branches))
end
in (let cres = (Microsoft_FStar_Tc_Util.bind env (Some (e1)) c1 ((Some (Microsoft_FStar_Tc_Env.Binding_var ((guard_x, c1.Microsoft_FStar_Absyn_Syntax.res_typ)))), c_branches))
in (let e = ((w cres) (Microsoft_FStar_Absyn_Syntax.mk_Exp_match (e1, (Support.List.map (fun _340440 -> (match (_340440) with
| (f, _, _, _) -> begin
f
end)) t_eqns))))
in ((Microsoft_FStar_Absyn_Syntax.mk_Exp_ascribed (e, cres.Microsoft_FStar_Absyn_Syntax.res_typ) e.Microsoft_FStar_Absyn_Syntax.pos), cres, (Microsoft_FStar_Tc_Rel.conj_guard g1 g_branches)))))
end))))
end))
end)))
end))
end
| Microsoft_FStar_Absyn_Syntax.Exp_let (((false, (x, t, e1)::[]), e2)) -> begin
(let env = (instantiate_both env)
in (let env0 = env
in (let topt = (Microsoft_FStar_Tc_Env.expected_typ env)
in (let top_level = (match (x) with
| Support.Microsoft.FStar.Util.Inr (_) -> begin
true
end
| _ -> begin
false
end)
in (let _340464 = (Microsoft_FStar_Tc_Env.clear_expected_typ env)
in (match (_340464) with
| (env1, _) -> begin
(let _340477 = (match (t.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_unknown -> begin
(Microsoft_FStar_Tc_Rel.trivial_guard, env1)
end
| _ -> begin
if (top_level && (not (env.Microsoft_FStar_Tc_Env.generalize))) then begin
(Microsoft_FStar_Tc_Rel.trivial_guard, (Microsoft_FStar_Tc_Env.set_expected_typ env1 t))
end else begin
(let _340470 = (tc_typ_check env1 t Microsoft_FStar_Absyn_Syntax.ktype)
in (match (_340470) with
| (t, f) -> begin
(let _340471 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Medium) then begin
(Support.Microsoft.FStar.Util.fprint2 "\x28%s\x29 Checked type annotation %s\n" (Support.Microsoft.FStar.Range.string_of_range top.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.typ_to_string t))
end
in (let t = (norm_t env1 t)
in (let env1 = (Microsoft_FStar_Tc_Env.set_expected_typ env1 t)
in (f, env1))))
end))
end
end)
in (match (_340477) with
| (f, env1) -> begin
(let _340483 = (tc_exp (let _340478 = env1
in {Microsoft_FStar_Tc_Env.solver = _340478.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _340478.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _340478.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _340478.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _340478.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _340478.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _340478.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _340478.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _340478.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _340478.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _340478.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _340478.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _340478.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _340478.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = top_level; Microsoft_FStar_Tc_Env.check_uvars = _340478.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = _340478.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = _340478.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _340478.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _340478.Microsoft_FStar_Tc_Env.default_effects}) e1)
in (match (_340483) with
| (e1, c1, g1) -> begin
(let _340487 = (Microsoft_FStar_Tc_Util.strengthen_precondition (Some ((fun _340484 -> (match (_340484) with
| () -> begin
Microsoft_FStar_Tc_Errors.ill_kinded_type
end)))) (Microsoft_FStar_Tc_Env.set_range env t.Microsoft_FStar_Absyn_Syntax.pos) e1 c1 f)
in (match (_340487) with
| (c1, guard_f) -> begin
(match (x) with
| Support.Microsoft.FStar.Util.Inr (_) -> begin
(let _340500 = if (Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str) then begin
(let _340495 = (Microsoft_FStar_Tc_Util.check_top_level env (Microsoft_FStar_Tc_Rel.conj_guard g1 guard_f) c1)
in (match (_340495) with
| (ok, c1) -> begin
if ok then begin
(e2, c1)
end else begin
(let _340496 = if (Support.ST.read Microsoft_FStar_Options.warn_top_level_effects) then begin
(Microsoft_FStar_Tc_Errors.warn (Microsoft_FStar_Tc_Env.get_range env) Microsoft_FStar_Tc_Errors.top_level_effect)
end
in ((Microsoft_FStar_Absyn_Syntax.mk_Exp_meta (Microsoft_FStar_Absyn_Syntax.Meta_desugared ((e2, Microsoft_FStar_Absyn_Syntax.MaskedEffect)))), c1))
end
end))
end else begin
(let _340491 = (Microsoft_FStar_Tc_Util.discharge_guard env (Microsoft_FStar_Tc_Rel.conj_guard g1 guard_f))
in (e2, (c1.Microsoft_FStar_Absyn_Syntax.comp ())))
end
in (match (_340500) with
| (e2, c1) -> begin
(let _340505 = if env.Microsoft_FStar_Tc_Env.generalize then begin
((Support.List.hd) (Microsoft_FStar_Tc_Util.generalize false env1 (((x, e1, c1))::[])))
end else begin
(x, e1, c1)
end
in (match (_340505) with
| (_, e1, c1) -> begin
(let cres = (Microsoft_FStar_Tc_Util.lcomp_of_comp (Microsoft_FStar_Absyn_Util.ml_comp Microsoft_FStar_Tc_Recheck.t_unit top.Microsoft_FStar_Absyn_Syntax.pos))
in (let cres = if (Microsoft_FStar_Absyn_Util.is_total_comp c1) then begin
cres
end else begin
(Microsoft_FStar_Tc_Util.bind env None (Microsoft_FStar_Tc_Util.lcomp_of_comp c1) (None, cres))
end
in (let _340508 = (Support.ST.op_ColonEquals e2.Microsoft_FStar_Absyn_Syntax.tk (Some (Microsoft_FStar_Tc_Recheck.t_unit)))
in (((w cres) (Microsoft_FStar_Absyn_Syntax.mk_Exp_let ((false, ((x, (Microsoft_FStar_Absyn_Util.comp_result c1), e1))::[]), e2))), cres, Microsoft_FStar_Tc_Rel.trivial_guard))))
end))
end))
end
| Support.Microsoft.FStar.Util.Inl (bvd) -> begin
(let b = (binding_of_lb x c1.Microsoft_FStar_Absyn_Syntax.res_typ)
in (let _340516 = (tc_exp (Microsoft_FStar_Tc_Env.push_local_binding env b) e2)
in (match (_340516) with
| (e2, c2, g2) -> begin
(let cres = (Microsoft_FStar_Tc_Util.bind env (Some (e1)) c1 (Some (b), c2))
in (let e = ((w cres) (Microsoft_FStar_Absyn_Syntax.mk_Exp_let ((false, ((x, c1.Microsoft_FStar_Absyn_Syntax.res_typ, e1))::[]), e2)))
in (let g2 = ((Microsoft_FStar_Tc_Rel.close_guard (((Microsoft_FStar_Absyn_Syntax.v_binder (Microsoft_FStar_Absyn_Util.bvd_to_bvar_s bvd c1.Microsoft_FStar_Absyn_Syntax.res_typ)))::[])) (Microsoft_FStar_Tc_Rel.imp_guard (Microsoft_FStar_Tc_Rel.guard_of_guard_formula (Microsoft_FStar_Tc_Rel.NonTrivial ((Microsoft_FStar_Absyn_Util.mk_eq c1.Microsoft_FStar_Absyn_Syntax.res_typ c1.Microsoft_FStar_Absyn_Syntax.res_typ (Microsoft_FStar_Absyn_Util.bvd_to_exp bvd c1.Microsoft_FStar_Absyn_Syntax.res_typ) e1)))) g2))
in (let guard = (Microsoft_FStar_Tc_Rel.conj_guard guard_f (Microsoft_FStar_Tc_Rel.conj_guard g1 g2))
in (match (topt) with
| None -> begin
(let tres = cres.Microsoft_FStar_Absyn_Syntax.res_typ
in (let fvs = (Microsoft_FStar_Absyn_Util.freevars_typ tres)
in if (Support.Microsoft.FStar.Util.set_mem (Microsoft_FStar_Absyn_Util.bvd_to_bvar_s bvd t) fvs.Microsoft_FStar_Absyn_Syntax.fxvs) then begin
(let t = (Microsoft_FStar_Tc_Util.new_tvar env0 Microsoft_FStar_Absyn_Syntax.ktype)
in (let _340525 = ((Microsoft_FStar_Tc_Rel.try_discharge_guard env) (Microsoft_FStar_Tc_Rel.teq env tres t))
in (e, cres, guard)))
end else begin
(e, cres, guard)
end))
end
| _ -> begin
(e, cres, guard)
end)))))
end)))
end)
end))
end))
end))
end))))))
end
| Microsoft_FStar_Absyn_Syntax.Exp_let (((false, _), _)) -> begin
(failwith ("impossible"))
end
| Microsoft_FStar_Absyn_Syntax.Exp_let (((true, lbs), e1)) -> begin
(let env = (instantiate_both env)
in (let _340546 = (Microsoft_FStar_Tc_Env.clear_expected_typ env)
in (match (_340546) with
| (env0, topt) -> begin
(let is_inner_let = ((Support.Microsoft.FStar.Util.for_some (fun _338607 -> (match (_338607) with
| (Support.Microsoft.FStar.Util.Inl (_), _, _) -> begin
true
end
| _ -> begin
false
end))) lbs)
in (let _340582 = ((Support.List.fold_left (fun _340561 _340565 -> (match ((_340561, _340565)) with
| ((xts, env), (x, t, e)) -> begin
(let _340570 = (Microsoft_FStar_Tc_Util.extract_lb_annotation env t e)
in (match (_340570) with
| (_, t, check_t) -> begin
(let e = (Microsoft_FStar_Absyn_Util.unascribe e)
in (let t = if (not (check_t)) then begin
t
end else begin
if ((not (is_inner_let)) && (not (env.Microsoft_FStar_Tc_Env.generalize))) then begin
(let _340574 = if ((Microsoft_FStar_Tc_Env.debug env) Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint1 "Type %s is marked as no-generalize\n" (Microsoft_FStar_Absyn_Print.typ_to_string t))
end
in t)
end else begin
((norm_t env) (tc_typ_check_trivial (let _340572 = env0
in {Microsoft_FStar_Tc_Env.solver = _340572.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _340572.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _340572.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _340572.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _340572.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _340572.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _340572.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _340572.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _340572.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _340572.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _340572.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _340572.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _340572.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _340572.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _340572.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = true; Microsoft_FStar_Tc_Env.use_eq = _340572.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = _340572.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _340572.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _340572.Microsoft_FStar_Tc_Env.default_effects}) t Microsoft_FStar_Absyn_Syntax.ktype))
end
end
in (let env = if ((Microsoft_FStar_Absyn_Util.is_pure_or_ghost_function t) && (Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str)) then begin
(let _340577 = env
in {Microsoft_FStar_Tc_Env.solver = _340577.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _340577.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _340577.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _340577.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _340577.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _340577.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _340577.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _340577.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _340577.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _340577.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _340577.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _340577.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _340577.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = ((x, t))::env.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _340577.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _340577.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = _340577.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = _340577.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _340577.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _340577.Microsoft_FStar_Tc_Env.default_effects})
end else begin
(Microsoft_FStar_Tc_Env.push_local_binding env (binding_of_lb x t))
end
in (((x, t, e))::xts, env))))
end))
end)) ([], env)) lbs)
in (match (_340582) with
| (lbs, env') -> begin
(let _340597 = ((Support.List.unzip) ((Support.List.map (fun _340586 -> (match (_340586) with
| (x, t, e) -> begin
(let t = (Microsoft_FStar_Tc_Normalize.norm_typ ((Microsoft_FStar_Tc_Normalize.Beta)::[]) env t)
in (let _340588 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint3 "Checking %s = %s against type %s\n" (Microsoft_FStar_Absyn_Print.lbname_to_string x) (Microsoft_FStar_Absyn_Print.exp_to_string e) (Microsoft_FStar_Absyn_Print.typ_to_string t))
end
in (let env' = (Microsoft_FStar_Tc_Env.set_expected_typ env' t)
in (let _340594 = (tc_total_exp env' e)
in (match (_340594) with
| (e, t, g) -> begin
((x, t, e), g)
end)))))
end))) ((Support.List.rev) lbs)))
in (match (_340597) with
| (lbs, gs) -> begin
(let g_lbs = (Support.List.fold_right Microsoft_FStar_Tc_Rel.conj_guard gs Microsoft_FStar_Tc_Rel.trivial_guard)
in (let _340612 = if ((not (env.Microsoft_FStar_Tc_Env.generalize)) || is_inner_let) then begin
(lbs, g_lbs)
end else begin
(let _340599 = (Microsoft_FStar_Tc_Util.discharge_guard env g_lbs)
in (let ecs = (Microsoft_FStar_Tc_Util.generalize true env ((Support.List.map (fun _340604 -> (match (_340604) with
| (x, t, e) -> begin
(x, e, ((Microsoft_FStar_Absyn_Util.total_comp t) (Microsoft_FStar_Absyn_Util.range_of_lb (x, t, e))))
end))) lbs))
in ((Support.List.map (fun _340609 -> (match (_340609) with
| (x, e, c) -> begin
(x, (Microsoft_FStar_Absyn_Util.comp_result c), e)
end)) ecs), Microsoft_FStar_Tc_Rel.trivial_guard)))
end
in (match (_340612) with
| (lbs, g_lbs) -> begin
if (not (is_inner_let)) then begin
(let cres = (Microsoft_FStar_Tc_Util.lcomp_of_comp (Microsoft_FStar_Absyn_Util.total_comp Microsoft_FStar_Tc_Recheck.t_unit top.Microsoft_FStar_Absyn_Syntax.pos))
in (let _340672 = (Microsoft_FStar_Tc_Util.discharge_guard env g_lbs)
in (let _340674 = (Support.ST.op_ColonEquals e1.Microsoft_FStar_Absyn_Syntax.tk (Some (Microsoft_FStar_Tc_Recheck.t_unit)))
in (((w cres) (Microsoft_FStar_Absyn_Syntax.mk_Exp_let ((true, lbs), e1))), cres, Microsoft_FStar_Tc_Rel.trivial_guard))))
end else begin
(let _340625 = ((Support.List.fold_left (fun _340615 _340620 -> (match ((_340615, _340620)) with
| ((bindings, env), (x, t, _)) -> begin
(let b = (binding_of_lb x t)
in (let env = (Microsoft_FStar_Tc_Env.push_local_binding env b)
in ((b)::bindings, env)))
end)) ([], env)) lbs)
in (match (_340625) with
| (bindings, env) -> begin
(let _340629 = (tc_exp env e1)
in (match (_340629) with
| (e1, cres, g1) -> begin
(let guard = (Microsoft_FStar_Tc_Rel.conj_guard g_lbs g1)
in (let cres = (Microsoft_FStar_Tc_Util.close_comp env bindings cres)
in (let tres = (norm_t env cres.Microsoft_FStar_Absyn_Syntax.res_typ)
in (let cres = (let _340633 = cres
in {Microsoft_FStar_Absyn_Syntax.eff_name = _340633.Microsoft_FStar_Absyn_Syntax.eff_name; Microsoft_FStar_Absyn_Syntax.res_typ = tres; Microsoft_FStar_Absyn_Syntax.cflags = _340633.Microsoft_FStar_Absyn_Syntax.cflags; Microsoft_FStar_Absyn_Syntax.comp = _340633.Microsoft_FStar_Absyn_Syntax.comp})
in (let e = ((w cres) (Microsoft_FStar_Absyn_Syntax.mk_Exp_let ((true, lbs), e1)))
in (match (topt) with
| Some (_) -> begin
(e, cres, guard)
end
| None -> begin
(let fvs = (Microsoft_FStar_Absyn_Util.freevars_typ tres)
in (match (((Support.List.tryFind (fun _338608 -> (match (_338608) with
| (Support.Microsoft.FStar.Util.Inr (_), _, _) -> begin
false
end
| (Support.Microsoft.FStar.Util.Inl (x), _, _) -> begin
(Support.Microsoft.FStar.Util.set_mem (Microsoft_FStar_Absyn_Util.bvd_to_bvar_s x Microsoft_FStar_Absyn_Syntax.tun) fvs.Microsoft_FStar_Absyn_Syntax.fxvs)
end))) lbs)) with
| Some ((Support.Microsoft.FStar.Util.Inl (y), _, _)) -> begin
(let t' = (Microsoft_FStar_Tc_Util.new_tvar env0 Microsoft_FStar_Absyn_Syntax.ktype)
in (let _340651 = ((Microsoft_FStar_Tc_Rel.try_discharge_guard env) (Microsoft_FStar_Tc_Rel.teq env tres t'))
in (e, cres, guard)))
end
| _ -> begin
(e, cres, guard)
end))
end))))))
end))
end))
end
end)))
end))
end)))
end)))
end))))))
and tc_eqn = (fun scrutinee_x pat_t env _340682 -> (match (_340682) with
| (pattern, when_clause, branch) -> begin
(let tc_pat = (fun allow_implicits pat_t p0 -> (let _340690 = (Microsoft_FStar_Tc_Util.pat_as_exps allow_implicits env p0)
in (match (_340690) with
| (bindings, exps, p) -> begin
(let pat_env = (Support.List.fold_left Microsoft_FStar_Tc_Env.push_local_binding env bindings)
in (let _340699 = if ((Microsoft_FStar_Tc_Env.debug env) (Microsoft_FStar_Options.Other ("Pat"))) then begin
((Support.List.iter (fun _338609 -> (match (_338609) with
| Microsoft_FStar_Tc_Env.Binding_var ((x, t)) -> begin
(Support.Microsoft.FStar.Util.fprint2 "Before tc ... pattern var %s  : %s\n" (Microsoft_FStar_Absyn_Print.strBvd x) (Microsoft_FStar_Tc_Normalize.typ_norm_to_string env t))
end
| _ -> begin
()
end))) bindings)
end
in (let _340704 = (Microsoft_FStar_Tc_Env.clear_expected_typ pat_env)
in (match (_340704) with
| (env1, _) -> begin
(let env1 = (let _340705 = env1
in {Microsoft_FStar_Tc_Env.solver = _340705.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _340705.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _340705.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _340705.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _340705.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _340705.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _340705.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _340705.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = true; Microsoft_FStar_Tc_Env.instantiate_targs = _340705.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _340705.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _340705.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _340705.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _340705.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _340705.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _340705.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = _340705.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = _340705.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _340705.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _340705.Microsoft_FStar_Tc_Env.default_effects})
in (let expected_pat_t = (Microsoft_FStar_Tc_Rel.unrefine env pat_t)
in (let exps = ((Support.List.map (fun e -> (let _340710 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "Checking pattern expression %s against expected type %s\n" (Microsoft_FStar_Absyn_Print.exp_to_string e) (Microsoft_FStar_Absyn_Print.typ_to_string pat_t))
end
in (let _340715 = (tc_exp env1 e)
in (match (_340715) with
| (e, lc, g) -> begin
(let _340716 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint2 "Pre-checked pattern expression %s at type %s\n" (Microsoft_FStar_Tc_Normalize.exp_norm_to_string env e) (Microsoft_FStar_Tc_Normalize.typ_norm_to_string env lc.Microsoft_FStar_Absyn_Syntax.res_typ))
end
in (let g' = (Microsoft_FStar_Tc_Rel.teq env lc.Microsoft_FStar_Absyn_Syntax.res_typ expected_pat_t)
in (let g = (Microsoft_FStar_Tc_Rel.conj_guard g g')
in (let _340720 = ((Support.Prims.ignore) (Microsoft_FStar_Tc_Rel.solve_deferred_constraints env g))
in (let e' = (Microsoft_FStar_Tc_Normalize.norm_exp ((Microsoft_FStar_Tc_Normalize.Beta)::[]) env e)
in (let _340723 = if (not ((Microsoft_FStar_Absyn_Util.uvars_included_in (Microsoft_FStar_Absyn_Util.uvars_in_exp e') (Microsoft_FStar_Absyn_Util.uvars_in_typ expected_pat_t)))) then begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Support.Microsoft.FStar.Util.format2 "Implicit pattern variables in %s could not be resolved against expected type %s; please bind them explicitly" (Microsoft_FStar_Absyn_Print.exp_to_string e') (Microsoft_FStar_Absyn_Print.typ_to_string expected_pat_t)), p.Microsoft_FStar_Absyn_Syntax.p))))
end
in (let _340725 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
(Support.Microsoft.FStar.Util.fprint1 "Done checking pattern expression %s\n" (Microsoft_FStar_Tc_Normalize.exp_norm_to_string env e))
end
in e)))))))
end))))) exps)
in (let p = (Microsoft_FStar_Tc_Util.decorate_pattern env p exps)
in (let _340736 = if ((Microsoft_FStar_Tc_Env.debug env) (Microsoft_FStar_Options.Other ("Pat"))) then begin
((Support.List.iter (fun _338610 -> (match (_338610) with
| Microsoft_FStar_Tc_Env.Binding_var ((x, t)) -> begin
(Support.Microsoft.FStar.Util.fprint2 "Pattern var %s  : %s\n" (Microsoft_FStar_Absyn_Print.strBvd x) (Microsoft_FStar_Absyn_Print.typ_to_string t))
end
| _ -> begin
()
end))) bindings)
end
in (p, bindings, pat_env, exps, Microsoft_FStar_Tc_Rel.trivial_guard))))))
end))))
end)))
in (let _340743 = (tc_pat true pat_t pattern)
in (match (_340743) with
| (pattern, bindings, pat_env, disj_exps, g_pat) -> begin
(let _340753 = (match (when_clause) with
| None -> begin
(None, Microsoft_FStar_Tc_Rel.trivial_guard)
end
| Some (e) -> begin
if (Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str) then begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("When clauses are not yet supported in --verify mode; they soon will be", e.Microsoft_FStar_Absyn_Syntax.pos))))
end else begin
(let _340750 = (tc_exp (Microsoft_FStar_Tc_Env.set_expected_typ pat_env Microsoft_FStar_Tc_Recheck.t_bool) e)
in (match (_340750) with
| (e, c, g) -> begin
(Some (e), g)
end))
end
end)
in (match (_340753) with
| (when_clause, g_when) -> begin
(let when_condition = (match (when_clause) with
| None -> begin
None
end
| Some (w) -> begin
(Some (Microsoft_FStar_Absyn_Util.mk_eq Microsoft_FStar_Absyn_Util.t_bool Microsoft_FStar_Absyn_Util.t_bool w Microsoft_FStar_Absyn_Const.exp_true_bool))
end)
in (let _340761 = (tc_exp pat_env branch)
in (match (_340761) with
| (branch, c, g_branch) -> begin
(let scrutinee = (Microsoft_FStar_Absyn_Util.bvd_to_exp scrutinee_x pat_t)
in (let _340766 = (Microsoft_FStar_Tc_Env.clear_expected_typ (Microsoft_FStar_Tc_Env.push_local_binding env (Microsoft_FStar_Tc_Env.Binding_var ((scrutinee_x, pat_t)))))
in (match (_340766) with
| (scrutinee_env, _) -> begin
(let c = (let eqs = ((Support.List.fold_left (fun fopt e -> (let e = (Microsoft_FStar_Absyn_Util.compress_exp e)
in (match (e.Microsoft_FStar_Absyn_Syntax.n) with
| (Microsoft_FStar_Absyn_Syntax.Exp_uvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_constant (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_fvar (_)) -> begin
fopt
end
| _ -> begin
(let clause = (Microsoft_FStar_Absyn_Util.mk_eq (Microsoft_FStar_Tc_Recheck.recompute_typ scrutinee) (Microsoft_FStar_Tc_Recheck.recompute_typ e) scrutinee e)
in (match (fopt) with
| None -> begin
Some (clause)
end
| Some (f) -> begin
(Some (Microsoft_FStar_Absyn_Util.mk_disj clause f))
end))
end))) None) disj_exps)
in (let c = (match ((eqs, when_condition)) with
| (None, None) -> begin
c
end
| (Some (f), None) -> begin
(Microsoft_FStar_Tc_Util.weaken_precondition env c (Microsoft_FStar_Tc_Rel.NonTrivial (f)))
end
| (Some (f), Some (w)) -> begin
(Microsoft_FStar_Tc_Util.weaken_precondition env c (Microsoft_FStar_Tc_Rel.NonTrivial ((Microsoft_FStar_Absyn_Util.mk_conj f w))))
end
| (None, Some (w)) -> begin
(Microsoft_FStar_Tc_Util.weaken_precondition env c (Microsoft_FStar_Tc_Rel.NonTrivial (w)))
end)
in (Microsoft_FStar_Tc_Util.close_comp env bindings c)))
in (let discriminate = (fun scrutinee f -> (let disc = ((Microsoft_FStar_Absyn_Util.fvar false (Microsoft_FStar_Absyn_Util.mk_discriminator f.Microsoft_FStar_Absyn_Syntax.v)) (Microsoft_FStar_Absyn_Syntax.range_of_lid f.Microsoft_FStar_Absyn_Syntax.v))
in (let disc = (Microsoft_FStar_Absyn_Syntax.mk_Exp_app (disc, ((Microsoft_FStar_Absyn_Syntax.varg scrutinee))::[]) None scrutinee.Microsoft_FStar_Absyn_Syntax.pos)
in (Microsoft_FStar_Absyn_Util.mk_eq Microsoft_FStar_Absyn_Util.t_bool Microsoft_FStar_Absyn_Util.t_bool disc Microsoft_FStar_Absyn_Const.exp_true_bool))))
in (let rec mk_guard = (fun scrutinee pat_exp -> (let pat_exp = (Microsoft_FStar_Absyn_Util.compress_exp pat_exp)
in (match (pat_exp.Microsoft_FStar_Absyn_Syntax.n) with
| (Microsoft_FStar_Absyn_Syntax.Exp_uvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_app (({Microsoft_FStar_Absyn_Syntax.n = Microsoft_FStar_Absyn_Syntax.Exp_uvar (_); Microsoft_FStar_Absyn_Syntax.tk = _; Microsoft_FStar_Absyn_Syntax.pos = _; Microsoft_FStar_Absyn_Syntax.fvs = _; Microsoft_FStar_Absyn_Syntax.uvs = _}, _))) | (Microsoft_FStar_Absyn_Syntax.Exp_bvar (_)) -> begin
(Microsoft_FStar_Absyn_Util.ftv Microsoft_FStar_Absyn_Const.true_lid Microsoft_FStar_Absyn_Syntax.ktype)
end
| Microsoft_FStar_Absyn_Syntax.Exp_constant (_) -> begin
(Microsoft_FStar_Absyn_Syntax.mk_Typ_app (Microsoft_FStar_Absyn_Util.teq, ((Microsoft_FStar_Absyn_Syntax.varg scrutinee))::((Microsoft_FStar_Absyn_Syntax.varg pat_exp))::[]) None scrutinee.Microsoft_FStar_Absyn_Syntax.pos)
end
| Microsoft_FStar_Absyn_Syntax.Exp_fvar ((f, _)) -> begin
(discriminate scrutinee f)
end
| Microsoft_FStar_Absyn_Syntax.Exp_app (({Microsoft_FStar_Absyn_Syntax.n = Microsoft_FStar_Absyn_Syntax.Exp_fvar ((f, _)); Microsoft_FStar_Absyn_Syntax.tk = _; Microsoft_FStar_Absyn_Syntax.pos = _; Microsoft_FStar_Absyn_Syntax.fvs = _; Microsoft_FStar_Absyn_Syntax.uvs = _}, args)) -> begin
(let head = (discriminate scrutinee f)
in (let sub_term_guards = ((Support.List.flatten) ((Support.List.mapi (fun i arg -> (match ((Support.Prims.fst arg)) with
| Support.Microsoft.FStar.Util.Inl (_) -> begin
[]
end
| Support.Microsoft.FStar.Util.Inr (ei) -> begin
(let projector = (Microsoft_FStar_Tc_Env.lookup_projector env f.Microsoft_FStar_Absyn_Syntax.v i)
in (let sub_term = (Microsoft_FStar_Absyn_Syntax.mk_Exp_app ((Microsoft_FStar_Absyn_Util.fvar false projector f.Microsoft_FStar_Absyn_Syntax.p), ((Microsoft_FStar_Absyn_Syntax.varg scrutinee))::[]) None f.Microsoft_FStar_Absyn_Syntax.p)
in ((mk_guard sub_term ei))::[]))
end))) args))
in (Microsoft_FStar_Absyn_Util.mk_conj_l ((head)::sub_term_guards))))
end
| _ -> begin
(failwith ((Support.Microsoft.FStar.Util.format2 "tc\x5feqn: Impossible \x28%s\x29 %s" (Support.Microsoft.FStar.Range.string_of_range pat_exp.Microsoft_FStar_Absyn_Syntax.pos) (Microsoft_FStar_Absyn_Print.exp_to_string pat_exp))))
end)))
in (let mk_guard = (fun s tsc pat -> if (not ((Microsoft_FStar_Options.should_verify env.Microsoft_FStar_Tc_Env.curmodule.Microsoft_FStar_Absyn_Syntax.str))) then begin
(Microsoft_FStar_Absyn_Util.ftv Microsoft_FStar_Absyn_Const.true_lid Microsoft_FStar_Absyn_Syntax.ktype)
end else begin
(let t = (mk_guard s pat)
in (let _340881 = (tc_typ_check scrutinee_env t Microsoft_FStar_Absyn_Syntax.mk_Kind_type)
in (match (_340881) with
| (t, _) -> begin
t
end)))
end)
in (let path_guard = (Microsoft_FStar_Absyn_Util.mk_disj_l ((Support.List.map (fun e -> (mk_guard scrutinee pat_t (Microsoft_FStar_Tc_Normalize.norm_exp ((Microsoft_FStar_Tc_Normalize.Beta)::[]) env e)))) disj_exps))
in (let path_guard = (match (when_condition) with
| None -> begin
path_guard
end
| Some (w) -> begin
(Microsoft_FStar_Absyn_Util.mk_conj path_guard w)
end)
in (let guard = (Microsoft_FStar_Tc_Rel.conj_guard g_pat (Microsoft_FStar_Tc_Rel.conj_guard g_when g_branch))
in (let _340889 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.High) then begin
((Support.Microsoft.FStar.Util.fprint1 "Carrying guard from match: %s\n") (Microsoft_FStar_Tc_Rel.guard_to_string env guard))
end
in ((pattern, when_clause, branch), path_guard, c, (Microsoft_FStar_Tc_Rel.conj_guard g_pat (Microsoft_FStar_Tc_Rel.conj_guard g_when g_branch)))))))))))
end)))
end)))
end))
end)))
end))
and tc_kind_trivial = (fun env k -> (let _340895 = (tc_kind env k)
in (match (_340895) with
| (k, g) -> begin
(let _340896 = (Microsoft_FStar_Tc_Util.discharge_guard env g)
in k)
end)))
and tc_typ_trivial = (fun env t -> (let _340903 = (tc_typ env t)
in (match (_340903) with
| (t, k, g) -> begin
(let _340904 = (Microsoft_FStar_Tc_Util.discharge_guard env g)
in (t, k))
end)))
and tc_typ_check_trivial = (fun env t k -> (let _340911 = (tc_typ_check env t k)
in (match (_340911) with
| (t, f) -> begin
(let _340912 = (Microsoft_FStar_Tc_Util.discharge_guard env f)
in t)
end)))
and tc_total_exp = (fun env e -> (let _340919 = (tc_exp env e)
in (match (_340919) with
| (e, c, g) -> begin
if (Microsoft_FStar_Absyn_Util.is_total_lcomp c) then begin
(e, c.Microsoft_FStar_Absyn_Syntax.res_typ, g)
end else begin
(let g = (Microsoft_FStar_Tc_Rel.solve_deferred_constraints env g)
in (let c = ((norm_c env) (c.Microsoft_FStar_Absyn_Syntax.comp ()))
in (match ((Microsoft_FStar_Tc_Rel.sub_comp env c (Microsoft_FStar_Absyn_Util.total_comp (Microsoft_FStar_Absyn_Util.comp_result c) (Microsoft_FStar_Tc_Env.get_range env)))) with
| Some (g') -> begin
(e, (Microsoft_FStar_Absyn_Util.comp_result c), (Microsoft_FStar_Tc_Rel.conj_guard g g'))
end
| _ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Microsoft_FStar_Tc_Errors.expected_pure_expression e c), e.Microsoft_FStar_Absyn_Syntax.pos))))
end)))
end
end)))
and tc_ghost_exp = (fun env e -> (let _340931 = (tc_exp env e)
in (match (_340931) with
| (e, c, g) -> begin
if (Microsoft_FStar_Absyn_Util.is_total_lcomp c) then begin
(e, c.Microsoft_FStar_Absyn_Syntax.res_typ, g)
end else begin
(let expected_c = (Microsoft_FStar_Absyn_Util.gtotal_comp c.Microsoft_FStar_Absyn_Syntax.res_typ)
in (let g = (Microsoft_FStar_Tc_Rel.solve_deferred_constraints env g)
in (let c = ((norm_c env) (c.Microsoft_FStar_Absyn_Syntax.comp ()))
in (match ((Microsoft_FStar_Tc_Rel.sub_comp env c expected_c)) with
| Some (g') -> begin
(e, (Microsoft_FStar_Absyn_Util.comp_result c), (Microsoft_FStar_Tc_Rel.conj_guard g g'))
end
| _ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Microsoft_FStar_Tc_Errors.expected_ghost_expression e c), e.Microsoft_FStar_Absyn_Syntax.pos))))
end))))
end
end)))

let tc_tparams = (fun env tps -> (let _340944 = (tc_binders env tps)
in (match (_340944) with
| (tps, env, g) -> begin
(let _340945 = (Microsoft_FStar_Tc_Util.force_trivial env g)
in (tps, env))
end)))

let a_kwp_a = (fun env m s -> (match (s.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Kind_arrow (((Support.Microsoft.FStar.Util.Inl (a), _)::(Support.Microsoft.FStar.Util.Inl (wp), _)::(Support.Microsoft.FStar.Util.Inl (_), _)::[], _)) -> begin
(a, wp.Microsoft_FStar_Absyn_Syntax.sort)
end
| _ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Microsoft_FStar_Tc_Errors.unexpected_signature_for_monad env m s), (Microsoft_FStar_Absyn_Syntax.range_of_lid m)))))
end))

let rec tc_eff_decl = (fun env m -> (let _340978 = (tc_binders env m.Microsoft_FStar_Absyn_Syntax.binders)
in (match (_340978) with
| (binders, env, g) -> begin
(let _340979 = (Microsoft_FStar_Tc_Util.discharge_guard env g)
in (let mk = (tc_kind_trivial env m.Microsoft_FStar_Absyn_Syntax.signature)
in (let _340984 = (a_kwp_a env m.Microsoft_FStar_Absyn_Syntax.mname mk)
in (match (_340984) with
| (a, kwp_a) -> begin
(let a_typ = (Microsoft_FStar_Absyn_Util.btvar_to_typ a)
in (let b = (Microsoft_FStar_Absyn_Util.gen_bvar_p (Microsoft_FStar_Absyn_Syntax.range_of_lid m.Microsoft_FStar_Absyn_Syntax.mname) Microsoft_FStar_Absyn_Syntax.ktype)
in (let b_typ = (Microsoft_FStar_Absyn_Util.btvar_to_typ b)
in (let kwp_b = (Microsoft_FStar_Absyn_Util.subst_kind ((Support.Microsoft.FStar.Util.Inl ((a.Microsoft_FStar_Absyn_Syntax.v, b_typ)))::[]) kwp_a)
in (let kwlp_a = kwp_a
in (let kwlp_b = kwp_b
in (let a_kwp_b = (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.null_v_binder a_typ))::[], kwp_b) a_typ.Microsoft_FStar_Absyn_Syntax.pos)
in (let a_kwlp_b = a_kwp_b
in (let w = (fun k -> (k (Microsoft_FStar_Absyn_Syntax.range_of_lid m.Microsoft_FStar_Absyn_Syntax.mname)))
in (let ret = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_v_binder a_typ))::[], kwp_a)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.ret expected_k)))
in (let bind_wp = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.t_binder b))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwlp_a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder a_kwp_b))::((Microsoft_FStar_Absyn_Syntax.null_t_binder a_kwlp_b))::[], kwp_b)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.bind_wp expected_k)))
in (let bind_wlp = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.t_binder b))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwlp_a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder a_kwlp_b))::[], kwlp_b)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.bind_wlp expected_k)))
in (let if_then_else = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.t_binder b))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a))::[], kwp_a)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.if_then_else expected_k)))
in (let ite_wp = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwlp_a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a))::[], kwp_a)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.ite_wp expected_k)))
in (let ite_wlp = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwlp_a))::[], kwlp_a)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.ite_wlp expected_k)))
in (let wp_binop = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder (Microsoft_FStar_Absyn_Const.kbin Microsoft_FStar_Absyn_Syntax.ktype Microsoft_FStar_Absyn_Syntax.ktype Microsoft_FStar_Absyn_Syntax.ktype)))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a))::[], kwp_a)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.wp_binop expected_k)))
in (let wp_as_type = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a))::[], Microsoft_FStar_Absyn_Syntax.ktype)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.wp_as_type expected_k)))
in (let close_wp = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder b))::((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder a_kwp_b))::[], kwp_b)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.close_wp expected_k)))
in (let close_wp_t = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.null_t_binder Microsoft_FStar_Absyn_Syntax.ktype))::[], kwp_a)))))::[], kwp_a)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.close_wp_t expected_k)))
in (let _341018 = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder Microsoft_FStar_Absyn_Syntax.ktype))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a))::[], kwp_a)))
in (((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.assert_p expected_k)), ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.assume_p expected_k))))
in (match (_341018) with
| (assert_p, assume_p) -> begin
(let null_wp = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::[], kwp_a)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.null_wp expected_k)))
in (let trivial_wp = (let expected_k = (w (Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a))::[], Microsoft_FStar_Absyn_Syntax.ktype)))
in ((norm_t env) (tc_typ_check_trivial env m.Microsoft_FStar_Absyn_Syntax.trivial expected_k)))
in {Microsoft_FStar_Absyn_Syntax.mname = m.Microsoft_FStar_Absyn_Syntax.mname; Microsoft_FStar_Absyn_Syntax.binders = binders; Microsoft_FStar_Absyn_Syntax.qualifiers = m.Microsoft_FStar_Absyn_Syntax.qualifiers; Microsoft_FStar_Absyn_Syntax.signature = mk; Microsoft_FStar_Absyn_Syntax.ret = ret; Microsoft_FStar_Absyn_Syntax.bind_wp = bind_wp; Microsoft_FStar_Absyn_Syntax.bind_wlp = bind_wlp; Microsoft_FStar_Absyn_Syntax.if_then_else = if_then_else; Microsoft_FStar_Absyn_Syntax.ite_wp = ite_wp; Microsoft_FStar_Absyn_Syntax.ite_wlp = ite_wlp; Microsoft_FStar_Absyn_Syntax.wp_binop = wp_binop; Microsoft_FStar_Absyn_Syntax.wp_as_type = wp_as_type; Microsoft_FStar_Absyn_Syntax.close_wp = close_wp; Microsoft_FStar_Absyn_Syntax.close_wp_t = close_wp_t; Microsoft_FStar_Absyn_Syntax.assert_p = assert_p; Microsoft_FStar_Absyn_Syntax.assume_p = assume_p; Microsoft_FStar_Absyn_Syntax.null_wp = null_wp; Microsoft_FStar_Absyn_Syntax.trivial = trivial_wp}))
end)))))))))))))))))))))
end))))
end)))
and tc_decl = (fun env se deserialized -> (match (se) with
| Microsoft_FStar_Absyn_Syntax.Sig_pragma ((p, r)) -> begin
(match (p) with
| Microsoft_FStar_Absyn_Syntax.SetOptions (o) -> begin
(match ((Microsoft_FStar_Options.set_options o)) with
| Support.Microsoft.FStar.Getopt.GoOn -> begin
(se, env)
end
| Support.Microsoft.FStar.Getopt.Help -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Failed to process pragma: use \'fstar --help\' to see which options are available", r))))
end
| Support.Microsoft.FStar.Getopt.Die (s) -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Support.String.strcat "Failed to process pragma: " s), r))))
end)
end
| Microsoft_FStar_Absyn_Syntax.ResetOptions -> begin
(let _341037 = (env.Microsoft_FStar_Tc_Env.solver.Microsoft_FStar_Tc_Env.refresh ())
in (let _341039 = ((Support.Prims.ignore) (Microsoft_FStar_Options.reset_options ()))
in (se, env)))
end)
end
| Microsoft_FStar_Absyn_Syntax.Sig_new_effect ((ne, r)) -> begin
(let ne = (tc_eff_decl env ne)
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_new_effect ((ne, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (se, env))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_sub_effect ((sub, r)) -> begin
(let _341054 = (a_kwp_a env sub.Microsoft_FStar_Absyn_Syntax.source (Microsoft_FStar_Tc_Env.lookup_effect_lid env sub.Microsoft_FStar_Absyn_Syntax.source))
in (match (_341054) with
| (a, kwp_a_src) -> begin
(let _341057 = (a_kwp_a env sub.Microsoft_FStar_Absyn_Syntax.target (Microsoft_FStar_Tc_Env.lookup_effect_lid env sub.Microsoft_FStar_Absyn_Syntax.target))
in (match (_341057) with
| (b, kwp_b_tgt) -> begin
(let kwp_a_tgt = (Microsoft_FStar_Absyn_Util.subst_kind ((Support.Microsoft.FStar.Util.Inl ((b.Microsoft_FStar_Absyn_Syntax.v, (Microsoft_FStar_Absyn_Util.btvar_to_typ a))))::[]) kwp_b_tgt)
in (let expected_k = ((Microsoft_FStar_Absyn_Syntax.mk_Kind_arrow (((Microsoft_FStar_Absyn_Syntax.t_binder a))::((Microsoft_FStar_Absyn_Syntax.null_t_binder kwp_a_src))::[], kwp_a_tgt)) r)
in (let lift = (tc_typ_check_trivial env sub.Microsoft_FStar_Absyn_Syntax.lift expected_k)
in (let sub = (let _341061 = sub
in {Microsoft_FStar_Absyn_Syntax.source = _341061.Microsoft_FStar_Absyn_Syntax.source; Microsoft_FStar_Absyn_Syntax.target = _341061.Microsoft_FStar_Absyn_Syntax.target; Microsoft_FStar_Absyn_Syntax.lift = lift})
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_sub_effect ((sub, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (se, env)))))))
end))
end))
end
| Microsoft_FStar_Absyn_Syntax.Sig_tycon ((lid, tps, k, _mutuals, _data, tags, r)) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let _341078 = (tc_tparams env tps)
in (match (_341078) with
| (tps, env) -> begin
(let k = (match (k.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Kind_unknown -> begin
Microsoft_FStar_Absyn_Syntax.ktype
end
| _ -> begin
(tc_kind_trivial env k)
end)
in (let _341083 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Extreme) then begin
(Support.Microsoft.FStar.Util.fprint2 "Checked %s at kind %s\n" (Microsoft_FStar_Absyn_Print.sli lid) (Microsoft_FStar_Absyn_Print.kind_to_string (Microsoft_FStar_Absyn_Util.close_kind tps k)))
end
in (let k = (norm_k env k)
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_tycon ((lid, tps, k, _mutuals, _data, tags, r))
in (let _341101 = (match ((Microsoft_FStar_Absyn_Util.compress_kind k)) with
| {Microsoft_FStar_Absyn_Syntax.n = Microsoft_FStar_Absyn_Syntax.Kind_uvar (_); Microsoft_FStar_Absyn_Syntax.tk = _; Microsoft_FStar_Absyn_Syntax.pos = _; Microsoft_FStar_Absyn_Syntax.fvs = _; Microsoft_FStar_Absyn_Syntax.uvs = _} -> begin
((Microsoft_FStar_Tc_Util.force_trivial env) (Microsoft_FStar_Tc_Rel.keq env None k Microsoft_FStar_Absyn_Syntax.ktype))
end
| _ -> begin
()
end)
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (se, env)))))))
end)))
end
| Microsoft_FStar_Absyn_Syntax.Sig_kind_abbrev ((lid, tps, k, r)) -> begin
(let env0 = env
in (let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let _341114 = (tc_tparams env tps)
in (match (_341114) with
| (tps, env) -> begin
(let k = (tc_kind_trivial env k)
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_kind_abbrev ((lid, tps, k, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env0 se)
in (se, env))))
end))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_effect_abbrev ((lid, tps, c, tags, r)) -> begin
(let env0 = env
in (let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let _341129 = (tc_tparams env tps)
in (match (_341129) with
| (tps, env) -> begin
(let _341132 = (tc_comp env c)
in (match (_341132) with
| (c, g) -> begin
(let tags = ((Support.List.map (fun _338611 -> (match (_338611) with
| Microsoft_FStar_Absyn_Syntax.DefaultEffect (None) -> begin
(let c' = (Microsoft_FStar_Tc_Normalize.weak_norm_comp env c)
in Microsoft_FStar_Absyn_Syntax.DefaultEffect ((Some c'.Microsoft_FStar_Absyn_Syntax.effect_name)))
end
| t -> begin
t
end))) tags)
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_effect_abbrev ((lid, tps, c, tags, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env0 se)
in (se, env))))
end))
end))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((lid, tps, k, t, tags, r)) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let _341152 = (tc_tparams env tps)
in (match (_341152) with
| (tps, env') -> begin
(let _341158 = ((fun _341155 -> (match (_341155) with
| (t, k) -> begin
((norm_t env' t), (norm_k env' k))
end)) (tc_typ_trivial env' t))
in (match (_341158) with
| (t, k1) -> begin
(let k2 = (match (k.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Kind_unknown -> begin
k1
end
| _ -> begin
(let k2 = ((norm_k env) (tc_kind_trivial env' k))
in (let _341163 = ((Microsoft_FStar_Tc_Util.force_trivial env') (Microsoft_FStar_Tc_Rel.keq env' (Some (t)) k1 k2))
in k2))
end)
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((lid, tps, k2, t, tags, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (se, env))))
end))
end)))
end
| Microsoft_FStar_Absyn_Syntax.Sig_datacon ((lid, t, tycon, quals, mutuals, r)) -> begin
(let _341181 = tycon
in (match (_341181) with
| (tname, _, _) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let t = (tc_typ_check_trivial env t Microsoft_FStar_Absyn_Syntax.ktype)
in (let t = (norm_t env t)
in (let _341193 = (match ((Microsoft_FStar_Absyn_Util.function_formals t)) with
| Some ((formals, cod)) -> begin
(formals, (Microsoft_FStar_Absyn_Util.comp_result cod))
end
| _ -> begin
([], t)
end)
in (match (_341193) with
| (formals, result_t) -> begin
(let positivity_check = (fun formal -> (match ((Support.Prims.fst formal)) with
| Support.Microsoft.FStar.Util.Inl (_) -> begin
()
end
| Support.Microsoft.FStar.Util.Inr (x) -> begin
(let t = (Microsoft_FStar_Tc_Normalize.norm_typ ((Microsoft_FStar_Tc_Normalize.Beta)::(Microsoft_FStar_Tc_Normalize.DeltaHard)::[]) env x.Microsoft_FStar_Absyn_Syntax.sort)
in if ((Microsoft_FStar_Absyn_Util.is_function_typ t) && (Microsoft_FStar_Absyn_Util.is_pure_or_ghost_function t)) then begin
(let _341205 = ((Support.Microsoft.FStar.Util.must) (Microsoft_FStar_Absyn_Util.function_formals t))
in (match (_341205) with
| (formals, _) -> begin
((Support.List.iter (fun _341209 -> (match (_341209) with
| (a, _) -> begin
(match (a) with
| Support.Microsoft.FStar.Util.Inl (_) -> begin
()
end
| Support.Microsoft.FStar.Util.Inr (y) -> begin
(let t = y.Microsoft_FStar_Absyn_Syntax.sort
in (Microsoft_FStar_Absyn_Visit.collect_from_typ (fun b t -> (match ((Microsoft_FStar_Absyn_Util.compress_typ t).Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_const (f) -> begin
(match ((Support.List.tryFind (Microsoft_FStar_Absyn_Syntax.lid_equals f.Microsoft_FStar_Absyn_Syntax.v) mutuals)) with
| None -> begin
()
end
| Some (tname) -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Microsoft_FStar_Tc_Errors.constructor_fails_the_positivity_check env (Microsoft_FStar_Absyn_Util.fvar true lid (Microsoft_FStar_Absyn_Syntax.range_of_lid lid)) tname), (Microsoft_FStar_Absyn_Syntax.range_of_lid lid)))))
end)
end
| _ -> begin
()
end)) () t))
end)
end))) formals)
end))
end)
end))
in (let _341225 = ((Support.List.iter positivity_check) formals)
in (let _341232 = (match ((Microsoft_FStar_Absyn_Util.destruct result_t tname)) with
| Some (_) -> begin
()
end
| _ -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (((Microsoft_FStar_Tc_Errors.constructor_builds_the_wrong_type env (Microsoft_FStar_Absyn_Util.fvar true lid (Microsoft_FStar_Absyn_Syntax.range_of_lid lid)) result_t (Microsoft_FStar_Absyn_Util.ftv tname Microsoft_FStar_Absyn_Syntax.kun)), (Microsoft_FStar_Absyn_Syntax.range_of_lid lid)))))
end)
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_datacon ((lid, t, tycon, quals, mutuals, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (let _341236 = if (log env) then begin
(Support.Microsoft.FStar.Util.print_string (Support.Microsoft.FStar.Util.format2 "data %s : %s\n" lid.Microsoft_FStar_Absyn_Syntax.str (Microsoft_FStar_Tc_Normalize.typ_norm_to_string env t)))
end
in (se, env)))))))
end)))))
end))
end
| Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((lid, t, quals, r)) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let t = ((Microsoft_FStar_Tc_Normalize.norm_typ ((Microsoft_FStar_Tc_Normalize.Beta)::(Microsoft_FStar_Tc_Normalize.SNComp)::[]) env) (tc_typ_check_trivial env t Microsoft_FStar_Absyn_Syntax.ktype))
in (let _341246 = (Microsoft_FStar_Tc_Util.check_uvars r t)
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((lid, t, quals, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (let _341250 = if (log env) then begin
(Support.Microsoft.FStar.Util.print_string (Support.Microsoft.FStar.Util.format2 "val %s : %s\n" lid.Microsoft_FStar_Absyn_Syntax.str (Microsoft_FStar_Tc_Normalize.typ_norm_to_string env t)))
end
in (se, env)))))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_assume ((lid, phi, quals, r)) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let phi = ((norm_t env) (tc_typ_check_trivial env phi Microsoft_FStar_Absyn_Syntax.ktype))
in (let _341260 = (Microsoft_FStar_Tc_Util.check_uvars r phi)
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_assume ((lid, phi, quals, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (se, env))))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_let ((lbs, r, lids, quals)) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let _341312 = ((Support.List.fold_left (fun _341273 lb -> (match (_341273) with
| (gen, lbs) -> begin
(let _341309 = (match (lb) with
| (Support.Microsoft.FStar.Util.Inl (_), _, _) -> begin
(failwith ("impossible"))
end
| (Support.Microsoft.FStar.Util.Inr (l), t, e) -> begin
(let _341306 = (match ((Microsoft_FStar_Tc_Env.try_lookup_val_decl env l)) with
| None -> begin
(gen, lb)
end
| Some ((t', _)) -> begin
(let _341294 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Medium) then begin
(Support.Microsoft.FStar.Util.fprint2 "Using annotation %s for let binding %s\n" (Microsoft_FStar_Absyn_Print.typ_to_string t') l.Microsoft_FStar_Absyn_Syntax.str)
end
in (match (t.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_unknown -> begin
(false, (Support.Microsoft.FStar.Util.Inr (l), t', e))
end
| _ -> begin
(let _341299 = if (not (deserialized)) then begin
(Support.Microsoft.FStar.Util.print_string (Support.Microsoft.FStar.Util.format1 "%s: Warning: Annotation from val declaration overrides inline type annotation\n" (Support.Microsoft.FStar.Range.string_of_range r)))
end
in (false, (Support.Microsoft.FStar.Util.Inr (l), t', e)))
end))
end)
in (match (_341306) with
| (gen, (lb, t, e)) -> begin
(gen, (lb, t, e))
end))
end)
in (match (_341309) with
| (gen, lb) -> begin
(gen, (lb)::lbs)
end))
end)) (true, [])) (Support.Prims.snd lbs))
in (match (_341312) with
| (generalize, lbs') -> begin
(let lbs' = (Support.List.rev lbs')
in (let e = (Microsoft_FStar_Absyn_Syntax.mk_Exp_let (((Support.Prims.fst lbs), lbs'), ((syn' env Microsoft_FStar_Tc_Recheck.t_unit) (Microsoft_FStar_Absyn_Syntax.mk_Exp_constant Microsoft_FStar_Absyn_Syntax.Const_unit))) None r)
in (let _341347 = (match ((tc_exp (let _341343 = env
in {Microsoft_FStar_Tc_Env.solver = _341343.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _341343.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _341343.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _341343.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _341343.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _341343.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _341343.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _341343.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _341343.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _341343.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _341343.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _341343.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = generalize; Microsoft_FStar_Tc_Env.letrecs = _341343.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _341343.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _341343.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = _341343.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = _341343.Microsoft_FStar_Tc_Env.is_iface; Microsoft_FStar_Tc_Env.admit = _341343.Microsoft_FStar_Tc_Env.admit; Microsoft_FStar_Tc_Env.default_effects = _341343.Microsoft_FStar_Tc_Env.default_effects}) e)) with
| ({Microsoft_FStar_Absyn_Syntax.n = Microsoft_FStar_Absyn_Syntax.Exp_let ((lbs, e)); Microsoft_FStar_Absyn_Syntax.tk = _; Microsoft_FStar_Absyn_Syntax.pos = _; Microsoft_FStar_Absyn_Syntax.fvs = _; Microsoft_FStar_Absyn_Syntax.uvs = _}, _, g) when (Microsoft_FStar_Tc_Rel.is_trivial g) -> begin
(let quals = (match (e.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Exp_meta (Microsoft_FStar_Absyn_Syntax.Meta_desugared ((_, Microsoft_FStar_Absyn_Syntax.MaskedEffect))) -> begin
(Microsoft_FStar_Absyn_Syntax.HasMaskedEffect)::quals
end
| _ -> begin
quals
end)
in (Microsoft_FStar_Absyn_Syntax.Sig_let ((lbs, r, lids, quals)), lbs))
end
| _ -> begin
(failwith ("impossible"))
end)
in (match (_341347) with
| (se, lbs) -> begin
(let _341353 = if (log env) then begin
(Support.Microsoft.FStar.Util.fprint1 "%s\n" ((Support.String.concat "\n") ((Support.List.map (fun _341352 -> (match (_341352) with
| (lbname, t, _) -> begin
(Support.Microsoft.FStar.Util.format2 "let %s : %s" (Microsoft_FStar_Absyn_Print.lbname_to_string lbname) (Microsoft_FStar_Tc_Normalize.typ_norm_to_string env t))
end))) (Support.Prims.snd lbs))))
end
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (se, env)))
end))))
end)))
end
| Microsoft_FStar_Absyn_Syntax.Sig_main ((e, r)) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let env = (Microsoft_FStar_Tc_Env.set_expected_typ env Microsoft_FStar_Tc_Recheck.t_unit)
in (let _341365 = (tc_exp env e)
in (match (_341365) with
| (e, c, g1) -> begin
(let g1 = (Microsoft_FStar_Tc_Rel.solve_deferred_constraints env g1)
in (let _341371 = (check_expected_effect env (Some ((Microsoft_FStar_Absyn_Util.ml_comp Microsoft_FStar_Tc_Recheck.t_unit r))) (e, (c.Microsoft_FStar_Absyn_Syntax.comp ())))
in (match (_341371) with
| (e, _, g) -> begin
(let _341372 = (Microsoft_FStar_Tc_Util.discharge_guard env (Microsoft_FStar_Tc_Rel.conj_guard g1 g))
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_main ((e, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (se, env))))
end)))
end))))
end
| Microsoft_FStar_Absyn_Syntax.Sig_bundle ((ses, quals, lids, r)) -> begin
(let env = (Microsoft_FStar_Tc_Env.set_range env r)
in (let _341391 = ((Support.List.partition (fun _338612 -> (match (_338612) with
| Microsoft_FStar_Absyn_Syntax.Sig_tycon (_) -> begin
true
end
| _ -> begin
false
end))) ses)
in (match (_341391) with
| (tycons, rest) -> begin
(let _341400 = ((Support.List.partition (fun _338613 -> (match (_338613) with
| Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev (_) -> begin
true
end
| _ -> begin
false
end))) rest)
in (match (_341400) with
| (abbrevs, rest) -> begin
(let recs = ((Support.List.map (fun _338614 -> (match (_338614) with
| Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((lid, tps, k, t, [], r)) -> begin
(let k = (match (k.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Kind_unknown -> begin
((Support.Prims.fst) (Microsoft_FStar_Tc_Rel.new_kvar r tps))
end
| _ -> begin
k
end)
in (Microsoft_FStar_Absyn_Syntax.Sig_tycon ((lid, tps, k, [], [], [], r)), t))
end
| _ -> begin
(failwith ("impossible"))
end))) abbrevs)
in (let _341419 = (Support.List.split recs)
in (match (_341419) with
| (recs, abbrev_defs) -> begin
(let msg = if (Support.ST.read Microsoft_FStar_Options.logQueries) then begin
(Support.Microsoft.FStar.Util.format1 "Recursive bindings: %s" (Microsoft_FStar_Absyn_Print.sigelt_to_string_short se))
end else begin
""
end
in (let _341421 = (env.Microsoft_FStar_Tc_Env.solver.Microsoft_FStar_Tc_Env.push msg)
in (let _341428 = (tc_decls false env tycons deserialized)
in (match (_341428) with
| (tycons, _, _) -> begin
(let _341434 = (tc_decls false env recs deserialized)
in (match (_341434) with
| (recs, _, _) -> begin
(let env1 = (Microsoft_FStar_Tc_Env.push_sigelt env (Microsoft_FStar_Absyn_Syntax.Sig_bundle (((Support.List.append tycons recs), quals, lids, r))))
in (let _341441 = (tc_decls false env1 rest deserialized)
in (match (_341441) with
| (rest, _, _) -> begin
(let abbrevs = (Support.List.map2 (fun se t -> (match (se) with
| Microsoft_FStar_Absyn_Syntax.Sig_tycon ((lid, tps, k, [], [], [], r)) -> begin
(let tt = (Microsoft_FStar_Absyn_Util.close_with_lam tps (Microsoft_FStar_Absyn_Syntax.mk_Typ_ascribed (t, k) t.Microsoft_FStar_Absyn_Syntax.pos))
in (let _341457 = (tc_typ_trivial env1 tt)
in (match (_341457) with
| (tt, _) -> begin
(let _341466 = (match (tt.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_lam ((bs, t)) -> begin
(bs, t)
end
| _ -> begin
([], tt)
end)
in (match (_341466) with
| (tps, t) -> begin
Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((lid, tps, (Microsoft_FStar_Absyn_Util.compress_kind k), t, [], r))
end))
end)))
end
| _ -> begin
(failwith ((Support.Microsoft.FStar.Util.format1 "\x28%s\x29 Impossible" (Support.Microsoft.FStar.Range.string_of_range r))))
end)) recs abbrev_defs)
in (let _341470 = (env.Microsoft_FStar_Tc_Env.solver.Microsoft_FStar_Tc_Env.pop msg)
in (let se = Microsoft_FStar_Absyn_Syntax.Sig_bundle (((Support.List.append (Support.List.append tycons abbrevs) rest), quals, lids, r))
in (let env = (Microsoft_FStar_Tc_Env.push_sigelt env se)
in (se, env)))))
end)))
end))
end))))
end)))
end))
end)))
end))
and tc_decls = (fun for_export env ses deserialized -> (let _341494 = ((Support.List.fold_left (fun _341481 se -> (match (_341481) with
| (ses, all_non_private, env) -> begin
(let _341483 = if (Microsoft_FStar_Tc_Env.debug env Microsoft_FStar_Options.Low) then begin
(Support.Microsoft.FStar.Util.print_string (Support.Microsoft.FStar.Util.format1 "Checking sigelt\t%s\n" (Microsoft_FStar_Absyn_Print.sigelt_to_string se)))
end
in (let _341487 = (tc_decl env se deserialized)
in (match (_341487) with
| (se, env) -> begin
(let _341488 = (env.Microsoft_FStar_Tc_Env.solver.Microsoft_FStar_Tc_Env.encode_sig env se)
in (let non_private_decls = if for_export then begin
(non_private env se)
end else begin
[]
end
in ((se)::ses, (non_private_decls)::all_non_private, env)))
end)))
end)) ([], [], env)) ses)
in (match (_341494) with
| (ses, all_non_private, env) -> begin
((Support.List.rev ses), ((Support.List.flatten) (Support.List.rev all_non_private)), env)
end)))
and non_private = (fun env se -> (let is_private = (fun quals -> (Support.List.contains Microsoft_FStar_Absyn_Syntax.Private quals))
in (match (se) with
| Microsoft_FStar_Absyn_Syntax.Sig_bundle ((ses, quals, _, _)) -> begin
if (is_private quals) then begin
(let ses = ((Support.List.filter (fun _338615 -> (match (_338615) with
| Microsoft_FStar_Absyn_Syntax.Sig_datacon (_) -> begin
false
end
| _ -> begin
true
end))) ses)
in ((Support.List.map (fun _338616 -> (match (_338616) with
| Microsoft_FStar_Absyn_Syntax.Sig_tycon ((lid, bs, k, mutuals, datas, quals, r)) -> begin
Microsoft_FStar_Absyn_Syntax.Sig_tycon ((lid, bs, k, [], [], (Microsoft_FStar_Absyn_Syntax.Assumption)::quals, r))
end
| se -> begin
se
end))) ses))
end else begin
(se)::[]
end
end
| Microsoft_FStar_Absyn_Syntax.Sig_tycon ((_, _, _, _, _, quals, r)) -> begin
if (is_private quals) then begin
[]
end else begin
(se)::[]
end
end
| Microsoft_FStar_Absyn_Syntax.Sig_typ_abbrev ((l, bs, k, t, quals, r)) -> begin
if (is_private quals) then begin
(Microsoft_FStar_Absyn_Syntax.Sig_tycon ((l, bs, k, [], [], (Microsoft_FStar_Absyn_Syntax.Assumption)::quals, r)))::[]
end else begin
(se)::[]
end
end
| Microsoft_FStar_Absyn_Syntax.Sig_assume ((_, _, quals, _)) -> begin
if (is_private quals) then begin
[]
end else begin
(se)::[]
end
end
| Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((_, _, quals, _)) -> begin
if (is_private quals) then begin
[]
end else begin
(se)::[]
end
end
| Microsoft_FStar_Absyn_Syntax.Sig_main (_) -> begin
[]
end
| (Microsoft_FStar_Absyn_Syntax.Sig_new_effect (_)) | (Microsoft_FStar_Absyn_Syntax.Sig_sub_effect (_)) | (Microsoft_FStar_Absyn_Syntax.Sig_effect_abbrev (_)) | (Microsoft_FStar_Absyn_Syntax.Sig_pragma (_)) | (Microsoft_FStar_Absyn_Syntax.Sig_kind_abbrev (_)) -> begin
(se)::[]
end
| Microsoft_FStar_Absyn_Syntax.Sig_datacon (_) -> begin
(failwith ("Impossible"))
end
| Microsoft_FStar_Absyn_Syntax.Sig_let ((lbs, r, l, _)) -> begin
(let check_priv = (fun lbs -> (let is_priv = (fun _338617 -> (match (_338617) with
| (Support.Microsoft.FStar.Util.Inr (l), _, _) -> begin
(match ((Microsoft_FStar_Tc_Env.try_lookup_val_decl env l)) with
| Some ((_, qs)) -> begin
(Support.List.contains Microsoft_FStar_Absyn_Syntax.Private qs)
end
| _ -> begin
false
end)
end
| _ -> begin
false
end))
in (let some_priv = ((Support.Microsoft.FStar.Util.for_some is_priv) lbs)
in if some_priv then begin
if ((Support.Microsoft.FStar.Util.for_some (fun x -> (not ((is_priv x))))) lbs) then begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Some but not all functions in this mutually recursive nest are marked private", r))))
end else begin
true
end
end else begin
false
end)))
in (let _341623 = ((Support.List.partition (fun _341620 -> (match (_341620) with
| (_, t, _) -> begin
((Microsoft_FStar_Absyn_Util.is_pure_or_ghost_function t) && (not ((Microsoft_FStar_Absyn_Util.is_lemma t))))
end))) (Support.Prims.snd lbs))
in (match (_341623) with
| (pure_funs, rest) -> begin
(match ((pure_funs, rest)) with
| (_::_, _::_) -> begin
(raise (Microsoft_FStar_Absyn_Syntax.Error (("Pure functions cannot be mutually recursive with impure functions", r))))
end
| (_::_, []) -> begin
if (check_priv pure_funs) then begin
[]
end else begin
(se)::[]
end
end
| ([], _::_) -> begin
if (check_priv rest) then begin
[]
end else begin
((Support.List.collect (fun _341653 -> (match (_341653) with
| (x, t, _) -> begin
(match (x) with
| Support.Microsoft.FStar.Util.Inl (_) -> begin
(failwith ("impossible"))
end
| Support.Microsoft.FStar.Util.Inr (l) -> begin
(Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((l, t, (Microsoft_FStar_Absyn_Syntax.Assumption)::[], (Microsoft_FStar_Absyn_Syntax.range_of_lid l))))::[]
end)
end))) rest)
end
end
| ([], []) -> begin
(failwith ("Impossible"))
end)
end)))
end)))

let get_exports = (fun env modul non_private_decls -> (let assume_vals = (fun decls -> ((Support.List.map (fun _338618 -> (match (_338618) with
| Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((lid, t, quals, r)) -> begin
Microsoft_FStar_Absyn_Syntax.Sig_val_decl ((lid, t, (Microsoft_FStar_Absyn_Syntax.Assumption)::quals, r))
end
| s -> begin
s
end))) decls))
in if modul.Microsoft_FStar_Absyn_Syntax.is_interface then begin
non_private_decls
end else begin
(let exports = (Support.Microsoft.FStar.Util.find_map (Microsoft_FStar_Tc_Env.modules env) (fun m -> if (m.Microsoft_FStar_Absyn_Syntax.is_interface && (Microsoft_FStar_Absyn_Syntax.lid_equals modul.Microsoft_FStar_Absyn_Syntax.name m.Microsoft_FStar_Absyn_Syntax.name)) then begin
Some ((assume_vals m.Microsoft_FStar_Absyn_Syntax.exports))
end else begin
None
end))
in (match (exports) with
| None -> begin
non_private_decls
end
| Some (e) -> begin
e
end))
end))

let tc_partial_modul = (fun env modul -> (let name = (Support.Microsoft.FStar.Util.format2 "%s %s" (if modul.Microsoft_FStar_Absyn_Syntax.is_interface then begin
"interface"
end else begin
"module"
end) modul.Microsoft_FStar_Absyn_Syntax.name.Microsoft_FStar_Absyn_Syntax.str)
in (let msg = (Support.String.strcat "Internals for " name)
in (let env = (let _341684 = env
in {Microsoft_FStar_Tc_Env.solver = _341684.Microsoft_FStar_Tc_Env.solver; Microsoft_FStar_Tc_Env.range = _341684.Microsoft_FStar_Tc_Env.range; Microsoft_FStar_Tc_Env.curmodule = _341684.Microsoft_FStar_Tc_Env.curmodule; Microsoft_FStar_Tc_Env.gamma = _341684.Microsoft_FStar_Tc_Env.gamma; Microsoft_FStar_Tc_Env.modules = _341684.Microsoft_FStar_Tc_Env.modules; Microsoft_FStar_Tc_Env.expected_typ = _341684.Microsoft_FStar_Tc_Env.expected_typ; Microsoft_FStar_Tc_Env.level = _341684.Microsoft_FStar_Tc_Env.level; Microsoft_FStar_Tc_Env.sigtab = _341684.Microsoft_FStar_Tc_Env.sigtab; Microsoft_FStar_Tc_Env.is_pattern = _341684.Microsoft_FStar_Tc_Env.is_pattern; Microsoft_FStar_Tc_Env.instantiate_targs = _341684.Microsoft_FStar_Tc_Env.instantiate_targs; Microsoft_FStar_Tc_Env.instantiate_vargs = _341684.Microsoft_FStar_Tc_Env.instantiate_vargs; Microsoft_FStar_Tc_Env.effects = _341684.Microsoft_FStar_Tc_Env.effects; Microsoft_FStar_Tc_Env.generalize = _341684.Microsoft_FStar_Tc_Env.generalize; Microsoft_FStar_Tc_Env.letrecs = _341684.Microsoft_FStar_Tc_Env.letrecs; Microsoft_FStar_Tc_Env.top_level = _341684.Microsoft_FStar_Tc_Env.top_level; Microsoft_FStar_Tc_Env.check_uvars = _341684.Microsoft_FStar_Tc_Env.check_uvars; Microsoft_FStar_Tc_Env.use_eq = _341684.Microsoft_FStar_Tc_Env.use_eq; Microsoft_FStar_Tc_Env.is_iface = modul.Microsoft_FStar_Absyn_Syntax.is_interface; Microsoft_FStar_Tc_Env.admit = (not ((Microsoft_FStar_Options.should_verify modul.Microsoft_FStar_Absyn_Syntax.name.Microsoft_FStar_Absyn_Syntax.str))); Microsoft_FStar_Tc_Env.default_effects = _341684.Microsoft_FStar_Tc_Env.default_effects})
in (let _341687 = if (not ((Microsoft_FStar_Absyn_Syntax.lid_equals modul.Microsoft_FStar_Absyn_Syntax.name Microsoft_FStar_Absyn_Const.prims_lid))) then begin
(env.Microsoft_FStar_Tc_Env.solver.Microsoft_FStar_Tc_Env.push msg)
end
in (let env = (Microsoft_FStar_Tc_Env.set_current_module env modul.Microsoft_FStar_Absyn_Syntax.name)
in (let _341693 = (tc_decls true env modul.Microsoft_FStar_Absyn_Syntax.declarations modul.Microsoft_FStar_Absyn_Syntax.is_deserialized)
in (match (_341693) with
| (ses, non_private_decls, env) -> begin
((let _341694 = modul
in {Microsoft_FStar_Absyn_Syntax.name = _341694.Microsoft_FStar_Absyn_Syntax.name; Microsoft_FStar_Absyn_Syntax.declarations = ses; Microsoft_FStar_Absyn_Syntax.exports = _341694.Microsoft_FStar_Absyn_Syntax.exports; Microsoft_FStar_Absyn_Syntax.is_interface = _341694.Microsoft_FStar_Absyn_Syntax.is_interface; Microsoft_FStar_Absyn_Syntax.is_deserialized = _341694.Microsoft_FStar_Absyn_Syntax.is_deserialized}), non_private_decls, env)
end))))))))

let tc_more_partial_modul = (fun env modul decls -> (let _341702 = (tc_decls true env decls false)
in (match (_341702) with
| (ses, non_private_decls, env) -> begin
(let modul = (let _341703 = modul
in {Microsoft_FStar_Absyn_Syntax.name = _341703.Microsoft_FStar_Absyn_Syntax.name; Microsoft_FStar_Absyn_Syntax.declarations = (Support.List.append modul.Microsoft_FStar_Absyn_Syntax.declarations ses); Microsoft_FStar_Absyn_Syntax.exports = _341703.Microsoft_FStar_Absyn_Syntax.exports; Microsoft_FStar_Absyn_Syntax.is_interface = _341703.Microsoft_FStar_Absyn_Syntax.is_interface; Microsoft_FStar_Absyn_Syntax.is_deserialized = _341703.Microsoft_FStar_Absyn_Syntax.is_deserialized})
in (modul, non_private_decls, env))
end)))

let finish_partial_modul = (fun env modul npds -> (let exports = (get_exports env modul npds)
in (let modul = (let _341710 = modul
in {Microsoft_FStar_Absyn_Syntax.name = _341710.Microsoft_FStar_Absyn_Syntax.name; Microsoft_FStar_Absyn_Syntax.declarations = _341710.Microsoft_FStar_Absyn_Syntax.declarations; Microsoft_FStar_Absyn_Syntax.exports = exports; Microsoft_FStar_Absyn_Syntax.is_interface = modul.Microsoft_FStar_Absyn_Syntax.is_interface; Microsoft_FStar_Absyn_Syntax.is_deserialized = modul.Microsoft_FStar_Absyn_Syntax.is_deserialized})
in (let env = (Microsoft_FStar_Tc_Env.finish_module env modul)
in (let _341720 = if (not ((Microsoft_FStar_Absyn_Syntax.lid_equals modul.Microsoft_FStar_Absyn_Syntax.name Microsoft_FStar_Absyn_Const.prims_lid))) then begin
(let _341714 = (env.Microsoft_FStar_Tc_Env.solver.Microsoft_FStar_Tc_Env.pop (Support.String.strcat "Ending modul " modul.Microsoft_FStar_Absyn_Syntax.name.Microsoft_FStar_Absyn_Syntax.str))
in (let _341716 = if ((not (modul.Microsoft_FStar_Absyn_Syntax.is_interface)) || (Support.List.contains modul.Microsoft_FStar_Absyn_Syntax.name.Microsoft_FStar_Absyn_Syntax.str (Support.ST.read Microsoft_FStar_Options.admit_fsi))) then begin
(env.Microsoft_FStar_Tc_Env.solver.Microsoft_FStar_Tc_Env.encode_modul env modul)
end
in (let _341718 = (env.Microsoft_FStar_Tc_Env.solver.Microsoft_FStar_Tc_Env.refresh ())
in ((Support.Prims.ignore) (Microsoft_FStar_Options.reset_options ())))))
end
in (modul, env))))))

let tc_modul = (fun env modul -> (let _341727 = (tc_partial_modul env modul)
in (match (_341727) with
| (modul, non_private_decls, env) -> begin
(finish_partial_modul env modul non_private_decls)
end)))

let add_modul_to_tcenv = (fun en m -> (let do_sigelt = (fun en elt -> (let env = (Microsoft_FStar_Tc_Env.push_sigelt en elt)
in (let _341734 = (env.Microsoft_FStar_Tc_Env.solver.Microsoft_FStar_Tc_Env.encode_sig env elt)
in env)))
in (let en = (Microsoft_FStar_Tc_Env.set_current_module en m.Microsoft_FStar_Absyn_Syntax.name)
in (Microsoft_FStar_Tc_Env.finish_module (Support.List.fold_left do_sigelt en m.Microsoft_FStar_Absyn_Syntax.exports) m))))

let check_module = (fun env m -> (let _341739 = if ((Support.List.length (Support.ST.read Microsoft_FStar_Options.debug)) <> 0) then begin
(Support.Microsoft.FStar.Util.fprint2 "Checking %s: %s\n" (if m.Microsoft_FStar_Absyn_Syntax.is_interface then begin
"i\'face"
end else begin
"module"
end) (Microsoft_FStar_Absyn_Print.sli m.Microsoft_FStar_Absyn_Syntax.name))
end
in (let _341752 = if m.Microsoft_FStar_Absyn_Syntax.is_deserialized then begin
(let env' = (add_modul_to_tcenv env m)
in (m, env'))
end else begin
(let _341743 = (tc_modul env m)
in (match (_341743) with
| (m, env) -> begin
(let _341747 = if (Support.ST.read Microsoft_FStar_Options.serialize_mods) then begin
(let c_file_name = (Support.String.strcat (Support.String.strcat (Support.String.strcat (Support.String.strcat (Support.String.strcat (Microsoft_FStar_Options.get_fstar_home ()) "/") Microsoft_FStar_Options.cache_dir) "/") (Microsoft_FStar_Absyn_Syntax.text_of_lid m.Microsoft_FStar_Absyn_Syntax.name)) ".cache")
in (let _341745 = (Support.Microsoft.FStar.Util.print_string (Support.String.strcat (Support.String.strcat "Serializing module " (Microsoft_FStar_Absyn_Syntax.text_of_lid m.Microsoft_FStar_Absyn_Syntax.name)) "\n"))
in (Microsoft_FStar_Absyn_SSyntax.serialize_modul (Support.Microsoft.FStar.Util.get_owriter c_file_name) m)))
end
in (m, env))
end))
end
in (match (_341752) with
| (m, env) -> begin
(let _341753 = if (Microsoft_FStar_Options.should_dump m.Microsoft_FStar_Absyn_Syntax.name.Microsoft_FStar_Absyn_Syntax.str) then begin
(Support.Microsoft.FStar.Util.fprint1 "%s\n" (Microsoft_FStar_Absyn_Print.modul_to_string m))
end
in if m.Microsoft_FStar_Absyn_Syntax.is_interface then begin
([], env)
end else begin
((m)::[], env)
end)
end))))




