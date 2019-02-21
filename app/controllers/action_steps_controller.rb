class ActionStepsController < ApplicationController
  def index
    @action_steps = ActionStep.all

    render("action_step_templates/index.html.erb")
  end

  def show
    @action_step = ActionStep.find(params.fetch("id_to_display"))

    render("action_step_templates/show.html.erb")
  end

  def new_form
    @action_step = ActionStep.new

    render("action_step_templates/new_form.html.erb")
  end

  def create_row
    @action_step = ActionStep.new

    @action_step.goal_id = params.fetch("goal_id")
    @action_step.timeline = params.fetch("timeline")
    @action_step.lead_persons = params.fetch("lead_persons")
    @action_step.resources_needed = params.fetch("resources_needed")
    @action_step.specifics_of_implementation = params.fetch("specifics_of_implementation")
    @action_step.measures_of_success = params.fetch("measures_of_success")

    if @action_step.valid?
      @action_step.save

      redirect_back(:fallback_location => "/action_steps", :notice => "Action step created successfully.")
    else
      render("action_step_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @action_step = ActionStep.find(params.fetch("prefill_with_id"))

    render("action_step_templates/edit_form.html.erb")
  end

  def update_row
    @action_step = ActionStep.find(params.fetch("id_to_modify"))

    @action_step.goal_id = params.fetch("goal_id")
    @action_step.timeline = params.fetch("timeline")
    @action_step.lead_persons = params.fetch("lead_persons")
    @action_step.resources_needed = params.fetch("resources_needed")
    @action_step.specifics_of_implementation = params.fetch("specifics_of_implementation")
    @action_step.measures_of_success = params.fetch("measures_of_success")

    if @action_step.valid?
      @action_step.save

      redirect_to("/action_steps/#{@action_step.id}", :notice => "Action step updated successfully.")
    else
      render("action_step_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_goal
    @action_step = ActionStep.find(params.fetch("id_to_remove"))

    @action_step.destroy

    redirect_to("/goals/#{@action_step.goal_id}", notice: "ActionStep deleted successfully.")
  end

  def destroy_row
    @action_step = ActionStep.find(params.fetch("id_to_remove"))

    @action_step.destroy

    redirect_to("/action_steps", :notice => "Action step deleted successfully.")
  end
end
