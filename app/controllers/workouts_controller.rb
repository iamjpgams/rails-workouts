class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /workouts or /workouts.json
  def index
    @workouts = Workout.all
  end

  # GET /workouts/1 or /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    #@workout = Workout.new
    @workout = current_user.workouts.build
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts or /workouts.json
  def create
    #@workout = Workout.new(workout_params)
    @workout = current_user.workouts.build(workout_params)
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: "Workout was successfully created." }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1 or /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: "Workout was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1 or /workouts/1.json
  def destroy
    @workout.destroy!

    respond_to do |format|
      format.html { redirect_to workouts_path, notice: "Workout was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def correct_user
    @workout = current_user.workouts.find_by(id: params[:id])
    redirect_to workout_path, notice: "not authorized to edit this" if @workout.nil?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.friendly.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.expect(workout: [ :Name, :Style, :Desc, :Score, :user_id ])
    end
end
