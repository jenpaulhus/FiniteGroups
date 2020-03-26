intrinsic GetBasicAttributes() -> Any
  {Outputs SeqEnum of basic attributes}
  return [
    "Order",
    "Exponent",
    "IsAbelian",
    "IsCyclic",
    "IsSolvable",
    "IsNilpotent",
    //"IsMetaCyclic", double check this one...there is IsMetacyclicPGroup
    //"IsMetaAbelian",
    "IsSimple",
    //"IsSuperSolvable",
    "IsPerfect",
    "Center",
    //"Commutator",
    "FrattiniSubgroup",
    "Radical",
    "Socle",
    "AutomorphismGroup",
    "NilpotencyClass",
    "Ngens",
    "DerivedSeries",
    "DerivedLength",
    "ChiefSeries",
    "LowerCentralSeries",
    "UpperCentralSeries",
    ];
end intrinsic;

intrinsic AssignBasicAttributes(G::LMFDBGrp) -> Any
  {Assign basic attributes}
  attrs := GetBasicAttributes();
  GG := G`MagmaGrp;
  for attr in attrs do
    eval_str := Sprintf("return %o(GG);", attr);
    G``attr := eval eval_str;
  end for;
  //G`IsSuperSolvable := IsSupersoluble(GG); // thanks a lot Australia! :D
  return Sprintf("Basic attributes assigned to %o", G);
end intrinsic;
