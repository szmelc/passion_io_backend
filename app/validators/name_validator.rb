class NameValidator < ActiveModel::Validator
  def validate(record)
    if record.is_a?(Category)
      record.errors[:name] << I18n.t('errors.unique_name_error', model: 'vertical') if same_name_vertical(record)
    elsif record.is_a?(Vertical)
      record.errors[:name] << I18n.t('errors.unique_name_error', model: 'category') if same_name_category(record)
    end
  end

  private

  def same_name_vertical(record)
    Vertical.find_by(name: record.name).present?
  end

  def same_name_category(record)
    Category.find_by(name: record.name).present?
  end
end
