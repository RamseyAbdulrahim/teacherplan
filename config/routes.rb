Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "improvement_plans#index"
  # Routes for the Coach resource:

  # CREATE
  get("/coaches/new", { :controller => "coaches", :action => "new_form" })
  post("/create_coach", { :controller => "coaches", :action => "create_row" })

  # READ
  get("/coaches", { :controller => "coaches", :action => "index" })
  get("/coaches/:id_to_display", { :controller => "coaches", :action => "show" })

  # UPDATE
  get("/coaches/:prefill_with_id/edit", { :controller => "coaches", :action => "edit_form" })
  post("/update_coach/:id_to_modify", { :controller => "coaches", :action => "update_row" })

  # DELETE
  get("/delete_coach/:id_to_remove", { :controller => "coaches", :action => "destroy_row" })

  #------------------------------

  # Routes for the Action step resource:

  # CREATE
  get("/action_steps/new", { :controller => "action_steps", :action => "new_form" })
  post("/create_action_step", { :controller => "action_steps", :action => "create_row" })
  post("/create_action_step_from_goal", { :controller => "action_steps", :action => "create_row_from_goal" })

  # READ
  get("/action_steps", { :controller => "action_steps", :action => "index" })
  get("/action_steps/:id_to_display", { :controller => "action_steps", :action => "show" })

  # UPDATE
  get("/action_steps/:prefill_with_id/edit", { :controller => "action_steps", :action => "edit_form" })
  post("/update_action_step/:id_to_modify", { :controller => "action_steps", :action => "update_row" })

  # DELETE
  get("/delete_action_step/:id_to_remove", { :controller => "action_steps", :action => "destroy_row" })
  get("/delete_action_step_from_goal/:id_to_remove", { :controller => "action_steps", :action => "destroy_row_from_goal" })

  #------------------------------

  # Routes for the Goal resource:

  # CREATE
  get("/goals/new", { :controller => "goals", :action => "new_form" })
  post("/create_goal", { :controller => "goals", :action => "create_row" })
  post("/create_goal_from_improvement_plan", { :controller => "goals", :action => "create_row_from_improvement_plan" })

  # READ
  get("/goals", { :controller => "goals", :action => "index" })
  get("/goals/:id_to_display", { :controller => "goals", :action => "show" })

  # UPDATE
  get("/goals/:prefill_with_id/edit", { :controller => "goals", :action => "edit_form" })
  post("/update_goal/:id_to_modify", { :controller => "goals", :action => "update_row" })

  # DELETE
  get("/delete_goal/:id_to_remove", { :controller => "goals", :action => "destroy_row" })
  get("/delete_goal_from_plan/:id_to_remove", { :controller => "goals", :action => "destroy_row_from_plan" })

  #------------------------------

  # Routes for the Improvement plan resource:

  # CREATE
  get("/improvement_plans/new", { :controller => "improvement_plans", :action => "new_form" })
  post("/create_improvement_plan", { :controller => "improvement_plans", :action => "create_row" })
  post("/create_improvement_plan_from_coach", { :controller => "improvement_plans", :action => "create_row_from_coach" })

  # READ
  get("/improvement_plans", { :controller => "improvement_plans", :action => "index" })
  get("/improvement_plans/:id_to_display", { :controller => "improvement_plans", :action => "show" })

  # UPDATE
  get("/improvement_plans/:prefill_with_id/edit", { :controller => "improvement_plans", :action => "edit_form" })
  post("/update_improvement_plan/:id_to_modify", { :controller => "improvement_plans", :action => "update_row" })

  # DELETE
  get("/delete_improvement_plan/:id_to_remove", { :controller => "improvement_plans", :action => "destroy_row" })
  get("/delete_improvement_plan_from_coach/:id_to_remove", { :controller => "improvement_plans", :action => "destroy_row_from_coach" })
  get("/delete_improvement_plan_from_user/:id_to_remove", { :controller => "improvement_plans", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
