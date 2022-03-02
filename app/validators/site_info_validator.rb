class SiteInfoValidator < ActiveModel::Validator
  def validate(record)
    if SiteInfo.count > 0 || SiteInfo.first == self
      record.errors.add :base, "You can create only one row of this table"
    end
  end
end