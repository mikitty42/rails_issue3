class PicturesController < ApplicationController
  def index
      @pictures = Picture.all
  end

  def new
      if prams[:back]
          @picture = Picture.new(picture_params)
      else
          @picture = Picture.new
      end
  end
  
  def create
      @picture = Picture.new(picture_params)
      if @picture.save
          PictureMailer.picture_mail(@picture).deliver
          redirect_to pictures_path,notice: 'pictureの投稿に成功しました'
      else
          render :new
      end
  end

  def show
      @picture = Picture.find(params[:id])
  end

  def edit
      @picture = Picture.find(params[:id])
  end
  
  def update
      @picture = Picture.find(params[:id])
      if @picture.update(picture_params)
          redirect_to pictures_path,notice: 'pictureを編集しました'
      else
          render :edit
      end
  end
  
  def destroy
      @picture = Picture.find(params[:id])
      @picture.destroy
      redirect_to pictures_path,notice: 'pictureを削除しました'
  end
  
  def confirm
      @picture = Picture.new(picture_params)
      render :new if @picture.invalid?
  end
  
  
  private
  
  def picture_params
      params.require(:picture).permit(:image,:image_cache,:content)
  end
end
