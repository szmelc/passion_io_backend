# frozen_string_literal: true

module PolicyHelper
  def ensured?(condition, translation_key = 'forbidden')
    unless condition
      @error_message =
        I18n.t("policy.errors.#{translation_key}", default: I18n.t('policy.errors.forbidden'))
    end
    condition
  end

  def ensured_record_owner?
    ensured_user_authenticated? && ensured?(record_owner?, 'record_owner')
  end

  def ensured_user_authenticated?
    ensured?(user_authenticated?, 'user_authenticated')
  end

  def ensured_current_user?
    ensured_user_authenticated? && ensured?(current_user?(record), 'record_owner')
  end

  def current_user?(compared_user)
    user_authenticated? && user == compared_user
  end

  def record_owner?
    record_owner = record.is_a?(Course) ? record.author : record.user
    user_authenticated? && current_user?(record_owner)
  end

  def user_authenticated?
    user.present?
  end
end
