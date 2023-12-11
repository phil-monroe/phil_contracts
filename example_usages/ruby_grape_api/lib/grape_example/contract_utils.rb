module GrapeExample::ContractUtils
  def self.params_for_contract(contract)
    contract.descriptor.map do |field|
      # binding.pry

      required = field.label == :optional

      if field.type == :message
        [ field.json_name, { type: field_to_type(field), required: required, fields: params_for_contract(field.subtype.msgclass) }]
      else
        [field.json_name, { type: field_to_type(field), required: required, default: field.default }]
      end
    rescue StandardError => err
      binding.pry

    end.to_h
  end

  INTEGER_TYPES = %i[
    int32
    int64
    uint32
    uint64
    sint32
    sint64
  ]

  def self.field_to_type(field)
    if field.type == :message
      return Array[field.subtype.msgclass] if field.label == :repeated
      return Hash if field.label == :map

      return field.subtype.msgclass
    end

    return String if field.type == :string
    return Integer if field.type.to_s.start_with?('int') || field.type.to_s.start_with?('uint')
    return Grape::API::Boolean if field.type == :bool

    raise "Unknown proto type: #{field.type} subtype: #{field.subtype.type}"
  end
end
