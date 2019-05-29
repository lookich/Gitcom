require 'json'
require 'open-uri'
include Api::V1::Support::GetJson
include Api::V1::Support::GetUrl

class Api::V1::GitcommitsController < ApplicationController
  def index
    @gitcommit = Gitcommit.order('created_at DESC').page params[:page]
    respond_to do |format|
      format.html
      format.json { render json: @gitcommit, except: [:created_at, :updated_at] }
    end
  end

  def new
    @gitcommit = Gitcommit.new
  end

  def create
    if params[:gitcommit]
      Gitcommit.destroy_all
      get_json
      @gitcommit = Gitcommit.new(gitcommit_params)
      @hash.each do |item|
        get_url
        Gitcommit.create(
          owner: item['commit']['author']['name'],
          repo: params[:gitcommit][:repo],
          author_email: item['commit']['author']['email'],
          commit_url: @gitcommit.commit_url,
          commit_message: item['commit']['message'])
      end
      @gitcommit.save
      Gitcommit.last.destroy
      redirect_to api_v1_gitcommits_path(@gitcommit)
    elsif params[:commit] = 'Delete selected'
      remove_selected
    end
  end

  def remove_selected
    Gitcommit.destroy(params[:ids])
    respond_to do |format|
      @gitcommit = Gitcommit.all.page params[:page]
      format.js
      format.html { redirect_to api_v1_gitcommits_path }
    end
  end

  private

  def gitcommit_params
    params.permit(:owner, :repo, :author_email, :commit_url, :commit_message)
  end
end
