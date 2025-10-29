class RecurringRulesController < ApplicationController
  def new
    @recurring_rule = RecurringRule.new
  end

  def create
    @recurring_rule = RecurringRule.new(recurring_rule_params)
    if @recurring_rule.save
      redirect_to settings_index_path
    else
      render "new"
    end
  end

  def edit
    @recurring_rule = RecurringRule.find(params[:id])
  end

  def update
    @recurring_rule = RecurringRule.find(params[:id])
    if @recurring_rule.update(recurring_rule_params)
      redirect_to settings_index_path
    else
      render "edit"
    end
  end

  def destroy
    @recurring_rule = RecurringRule.find(params[:id])
    if @recurring_rule.destroy
      redirect_to settings_index_path
    else
      render "edit"
    end
  end

  private

  def recurring_rule_params
    params.expect(recurring_rule: [ :description, :amount, :month_day, :kind ])
  end
end
