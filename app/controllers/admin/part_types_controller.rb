class Admin::PartTypesController < AdminController
  before_action :set_part_type, only: %i[ show edit update destroy ]
  def index
    @pagy, @part_types = pagy(PartType.all)
  end

  def show
  end

  def new
    @part_type = PartType.new
  end

  def edit
  end

  def create
    @part_type = PartType.new(part_type_params)

    if @part_type.save
      redirect_to admin_part_type_path(@part_type), notice: "Part type successfully created."
    else
      render :new, alert: "Error when craeting part type"
    end
  end

  def update
    if @part_type.update(part_type_params)
      redirect_to admin_part_type_path(@part_type), notice: "Part type successfully updated."
    else
      render :edit, alert: "Error when updating part type"
    end
  end

  def destroy
    @part_type.destroy!

    redirect_to admin_part_types_path, notice: "Part type was seccessfully destroyed."
  end

  private
    def set_part_type
      @part_type = PartType.find(params.expect(:id))
    end

    def part_type_params
      params.expect(part_type: [ :name, :description, :image ])
    end
end
