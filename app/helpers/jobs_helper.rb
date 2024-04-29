# frozen_string_literal: true

module JobsHelper
  def salary_range
    min_salary = number_with_precision(@job.salary.min, unit: '')
    max_salary = number_to_currency(@job.salary.max, unit: '')
    "#{salary_symbol}#{formatted_salary(min_salary)} -
     #{salary_symbol}#{formatted_salary(max_salary)}
     #{@job.salary.currency.name}
     #{@job.salary.salary_type} "
  end

  def salary_symbol
    @job.salary.currency.symbol
  end

  def formatted_salary(value)
    number_with_delimiter(value, delimiter: ',')
  end
end
