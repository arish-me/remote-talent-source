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

  def currency_options
    Currency.all.map { |currency| [currency.name, currency.id] }
  end

  def default_currency_id
    default_currency = Currency.find_by(name: 'USD')
    default_currency ? default_currency.id : nil
  end

  def job_status(job)
    case job.current_state
    when 'pending'
      'Activate Job'
    when 'inactive'
      'Activate Job'
    when 'active'
      'De-activate Job'
    end
  end

  def job_status_class(job)
    case job.current_state
    when 'pending'
      'bg-warning'
    when 'inactive'
      'bg-danger'
    when 'active'
      'bg-primary'
    end
  end
end
