intrinsic order(M::LMFDBRepCC) -> FldRatElt
  {Return order of the group}
  return Order(M`MagmaGrp);
end intrinsic;

intrinsic dim(M::LMFDBRepCC) -> FldRatElt
  {Return the dimension of the representation}
  return Dimension(M`MagmaRep);
end intrinsic;

intrinsic irreducible(M::LMFDBRepCC) -> FldRatElt
  {Return true if the representation is irreducible; false otherwise.}
  return IsIrreducible(M`MagmaRep);
end intrinsic;

intrinsic indicator(M::LMFDBRepCC) -> FldRatElt
  {Computes the Frobenius-Schur indicator}
  Mat := M`MagmaGrp;
  ind := 0;
  for g in Mat do
    ind +:= Trace(g^2);
  end for;
  return (1/Get(M,'order'))*ind;
end intrinsic;

intrinsic cyc_order_mat(M::LMFDBRepCC) -> RngIntElt
  {an integer m so that the entries in the gens column lie in CyclotomicField(m)}
  MM := M`MagmaRep;
  MMmin := AbsoluteModuleOverMinimalField(MM);
  return Conductor(CoefficientRing(MMmin)); // or CyclotomicOrder?
end intrinsic;

intrinsic schur_index(M::LMFDBRepCC) -> RngIntElt
  {Returns the ratio of the minimal degree of a number field containing all matrix entries by the degree of the number field generated by the traces}
  m := Get(M, "cyc_order_mat");
  n := Get(M, "cyc_order_traces");
  assert m mod n eq 0;
  return m div n;
end intrinsic;

intrinsic AbsoluteModuleOverMinimalField(~M::LMFDBRepCC)
  {Assign to M`MagmaRep the absolutely irreducible module M over the smallest possible field without increasing the dimension of the module. Also assign M`MagmaGrp to be the corresponding group.}
  MM := M`MagmaRep;
  MMmin := AbsoluteModuleOverMinimalField(MM);
  M`MagmaRep := MMmin;
  M`MagmaGrp := MatrixGroup(MMmin);
  print "Module over minimal field computed and assigned";
end intrinsic;

// TODO: not quite right format...see propose schema
intrinsic WriteCyclotomicElement(u::FldCycElt) -> SeqEnum
  {Given an element u of a cyclotomic field with primitive root zeta_m, return a SeqEnum of pairs [c,e] such that
  u is the sum of c*zeta_m^e}
  //K<z> := CyclotomicField(Conductor(Parent(u)) : Sparse := false);
  K<z> := CyclotomicField(CyclotomicOrder(Parent(u)) : Sparse := false);
  m := CyclotomicOrder(K);
  u_seq := Eltseq(K!u);
  cs := [];
  for i := 1 to #u_seq do
    if u_seq[i] ne 0 then
      e := i-1;
      if e gt Floor(m/2) then // want e in range -m/2 < e <= m/2
        e := e - m;
      end if;
      assert (-m/2 lt e) and (e lt m/2); // should second lt be le?
      Append(~cs, [u_seq[i], e]);
    end if;
  end for;
  return cs;
end intrinsic;

intrinsic ReadCyclotomicElement(cs::SeqEnum, m::RngIntElt) -> FldCycElt
  {Given a SeqEnum of pairs representing a cyclotomic field element as in the output of WriteCyclotomicElement, construct t    he corresponding cyclotomic field element.}
  K<z> := CyclotomicField(m : Sparse := false);
  u := K!0; for pair in cs do
    e := Integers()!pair[2];
    u +:= pair[1]*z^e;
  end for;
  return u, K;
end intrinsic;

intrinsic CyclotomizeMatrixGroup(M::GrpMat) -> Any
  {Given a matrix group over an abelian number field, change the universe to a containing cyclotomic field}
  e := Exponent(M);
  if e mod 4 eq 2 then
    e := e div 2;
  end if;
  K<z> := CyclotomicField(e : Sparse := false);
  return ChangeRing(M,K);
end intrinsic;

intrinsic IntegralizeMatrix(M::AlgMatElt) -> Any
  {Given a matrix return a matrix with integral entries, along with a common denominator}
  d := 1;
  for i := 1 to Nrows(M) do
    for j := 1 to Ncols(M) do
      d := Lcm(d, Denominator(M[i,j]));
    end for;
  end for;
  return d*M, d;
end intrinsic;

//intrinsic WriteCyclotomicMatrix(M::GrpMatElt) -> SeqEnum
intrinsic WriteCyclotomicMatrix(M::Any) -> SeqEnum
  {Given a matrix over a cyclotomic field, return a SeqEnum whose entries are integral and of the form given by WriteCyclotomicElement.}
  M_seq := [];
  for row in Rows(M) do
    Append(~M_seq, [WriteCyclotomicElement(el) : el in Eltseq(row)]);
  end for;
  return M_seq;
end intrinsic;

intrinsic ReadCyclotomicMatrix(cs::SeqEnum, m::RngIntElt) -> GrpMatElt
  {Given a SeqEnum as in the output of WriteCyclotomicMatrix, return the corresponding matrix}
  K<z> := CyclotomicField(m : Sparse := false);
  rows := [];
  for r in cs do
    Append(~rows, [ReadCyclotomicElement(el,m) : el in r]);
  end for;
  return Matrix(K,rows);
end intrinsic;

intrinsic WriteIntegralMatrix(M::Any) -> SeqEnum
  {Given a matrix over a Z, return a SeqEnum.}
  return [ [el : el in Eltseq(row)] : row in Rows(M)];
end intrinsic;

intrinsic ReadIntegralMatrix(cs::SeqEnum) -> Any
  {Read a matrix over a Z, as a SeqEnum of rows}
  return Matrix(Integers(), cs);
end intrinsic;


intrinsic carat_label(G::LMFDBRepQQ) -> Any
  {Return the CARAT label for a repn of dimension < 7.  Will be computed by
   other software.}
  return None();
end intrinsic;

intrinsic order(H::LMFDBRepQQ) -> Any
  {The size of the group}
  return Order(H`MagmaGrp);
end intrinsic;

intrinsic group(H::LMFDBRepQQ) -> Any
  {returns the LMFDB id for the abstract group}
  return label(H`MagmaGrp);
end intrinsic;


intrinsic order(H::LMFDBRepZZ) -> Any
  {The size of the group}
  return Order(H`MagmaGrp);
end intrinsic;

intrinsic group(H::LMFDBRepZZ) -> Any
  {returns the LMFDB id for the abstract group}
  return label(H`MagmaGrp);
end intrinsic;