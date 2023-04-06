class CurrencyController < ApplicationController
  def first_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read

    @parsed_data = JSON.parse(@raw_data)

    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    render({ template: "currency_templates/step_one.html.erb" })
  end

  def second_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read

    @parsed_data = JSON.parse(@raw_data)

    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    # params are 
    # Parameters: {"from_currency" => "ARS"}

    @from_symbol = params.fetch("from_currency")

    render({ template: "currency_templates/step_two.html.erb" })
  end

  def third_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read

    @parsed_data = JSON.parse(@raw_data)

    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    @from_currency = params.fetch("from_currency")

    @new_currency = params.fetch("new_currency")

    @the_url = "https://api.exchangerate.host/convert?from=#{@from_currency}&to=#{@new_currency}"

    @raw_calculation = open(@the_url).read

    @parsed_calculation = JSON.parse(@raw_calculation)

    @rate_info = @parsed_calculation.fetch("info")

    @rate = @rate_info.fetch("rate")

    render({ template: "currency_templates/dashboards.html.erb" })
  end
end
