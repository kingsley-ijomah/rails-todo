class ArchivesController < ApplicationController
  def index
    @archives = Task.where(status: Task.statuses[:archived])
  end
end