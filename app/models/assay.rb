require 'open-uri'

class Assay
  attr_accessor :assay_id
  attr_reader :description

  def initialize assay_id, description
    self.assay_id = assay_id
    self.description = description
  end

  def Assay.search(target_name)
    pchem_result = open("https://pubchem.ncbi.nlm.nih.gov/rest/pug/assay/target/proteinname/#{target_name}/JSON")
    pchem = JSON.parse(pchem_result.read)

    pchem["PC_AssayContainer"].map do |assay|
      assay_id = assay["assay"]["descr"]["aid"]["id"]
      assay_descr = assay["assay"]["descr"]["description"]
      Assay.new(assay_id, assay_descr)
    end
  end

  def fetch_compounds
    cids_file = open("https://pubchem.ncbi.nlm.nih.gov/rest/pug/assay/aid/#{assay_id}/cids/JSON")
    cids = JSON.parse(cids_file.read)
    cids["InformationList"]["Information"][0]["CID"].map do |cid|
      Compound.new(cid)
    end
  end
end
