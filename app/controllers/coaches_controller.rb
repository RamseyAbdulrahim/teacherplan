class CoachesController < ApplicationController
  def index
    @q = Coach.ransack(params[:q])
    @coaches = @q.result(:distinct => true).includes(:improvement_plans).page(params[:page]).per(10)

    render("coach_templates/index.html.erb")
  end

  def show
    @improvement_plan = ImprovementPlan.new
    @coach = Coach.find(params.fetch("id_to_display"))

    render("coach_templates/show.html.erb")
  end

  def new_form
    @coach = Coach.new

    render("coach_templates/new_form.html.erb")
  end

  def create_row
    @coach = Coach.new

    @coach.inviter_id = params.fetch("inviter_id")
    @coach.invitee_id = params.fetch("invitee_id")

    if @coach.valid?
      @coach.save

      redirect_back(:fallback_location => "/coaches", :notice => "Coach created successfully.")
    else
      render("coach_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @coach = Coach.find(params.fetch("prefill_with_id"))

    render("coach_templates/edit_form.html.erb")
  end

  def update_row
    @coach = Coach.find(params.fetch("id_to_modify"))

    @coach.inviter_id = params.fetch("inviter_id")
    @coach.invitee_id = params.fetch("invitee_id")

    if @coach.valid?
      @coach.save

      redirect_to("/coaches/#{@coach.id}", :notice => "Coach updated successfully.")
    else
      render("coach_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @coach = Coach.find(params.fetch("id_to_remove"))

    @coach.destroy

    redirect_to("/coaches", :notice => "Coach deleted successfully.")
  end
end
