class CashFlowController < ApplicationController
  def index
    start_date = Date.current.prev_month.beginning_of_month
    end_date = 12.months.from_now.end_of_month.to_date
    result = CashFlowCalculator.new(start_date, end_date).call
    @cash_flow_days = result
  end
end
