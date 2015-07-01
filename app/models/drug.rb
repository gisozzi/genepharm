require 'open-uri'
require 'json'

class Drug < ActiveRecord::Base

	attr_reader :target_name
	attr_reader :pchem_result
	attr_reader :info_drug
	attr_reader :details
	attr_reader :property

	def Drug.search(target_name)
		Drug.new

		pchem_result = open("https://pubchem.ncbi.nlm.nih.gov/rest/pug/assay/target/proteinname/#{target_name}/JSON")
		JSON.parse(pchem_result.read)
	 end

	def Drug.show
		@drugs.pchem_result do
		pchem_result["PC_AssayContainer"]["assay"]["descr"]["aid"]["id"].to_query('info_drug')
		end
		details = open("https://pubchem.ncbi.nlm.nih.gov/rest/pug/assay/aid/#{info_drug}/cids/JSON")
		JSON.parse(details.read)

		property = open("https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/#{details}/property/MolecularFormula,MolecularWeight,CanonicalSMILES,IUPACName,XLogP,ExactMass,MonoisotopicMass,TPSA,Complexity,Charge,HBondDonorCount,HBondAcceptorCount,RotatableBondCount,HeavyAtomCount,IsotopeAtomCount,AtomStereoCount,DefinedAtomStereoCount,UndefinedAtomStereoCount,BondStereoCount,DefinedBondStereoCount,UndefinedBondStereoCount,CovalentUnitCount,Volume3D,XStericQuadrupole3D,YStericQuadrupole3D,ZStericQuadrupole3D,FeatureCount3D,FeatureAcceptorCount3D,FeatureDonorCount3D,FeatureAnionCount3D,FeatureCationCount3D,FeatureRingCount3D,FeatureHydrophobeCount3D,ConformerModelRMSD3D,EffectiveRotorCount3D,ConformerCount3D,Fingerprint2D/JSON")
		JSON.parse(property.read)
#		image = open("https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/#{details}/PNG")
	end
end