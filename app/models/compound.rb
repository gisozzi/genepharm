class Compound
  attr_accessor :cid

  def initialize cid
    self.cid = cid
  end

  def fetch_drug
    property_file = open("https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/#{cid}/property/MolecularFormula,MolecularWeight,CanonicalSMILES,IUPACName,XLogP,ExactMass,MonoisotopicMass,TPSA,Complexity,Charge,HBondDonorCount,HBondAcceptorCount,RotatableBondCount,HeavyAtomCount,IsotopeAtomCount,AtomStereoCount,DefinedAtomStereoCount,UndefinedAtomStereoCount,BondStereoCount,DefinedBondStereoCount,UndefinedBondStereoCount,CovalentUnitCount,Volume3D,XStericQuadrupole3D,YStericQuadrupole3D,ZStericQuadrupole3D,FeatureCount3D,FeatureAcceptorCount3D,FeatureDonorCount3D,FeatureAnionCount3D,FeatureCationCount3D,FeatureRingCount3D,FeatureHydrophobeCount3D,ConformerModelRMSD3D,EffectiveRotorCount3D,ConformerCount3D,Fingerprint2D/JSON")
    properties = JSON.parse(property_file.read)
    Drug.new(properties["PropertyTable"]["Properties"])
  end
end
