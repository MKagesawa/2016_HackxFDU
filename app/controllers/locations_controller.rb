class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get_photo
    Location.create(content: params[:content],longitude: params['longitude'] ,latitude: params['latitude'], url: params['url'],user_id: '1')
    render json: 'OK'
    return
  end

  def get_nearby
    locations = Location.near([params['latitude'], params['longitude']], params['distance']).map do |location| [location.id, location.longitude ,  location.latitude ]end
    render json: locations.to_json
    return
  end

  def get_info
    location = Location.find(params[:id])
    render json: location
    return
  end

  def get_min
    position = Location.all.where.not(id: User.first.passed).near([params['latitude'], params['longitude']],1000).map do |location| [location.distance,location.id] end.min
    if position && User.first.passed.index(position.last)== nil
      location = Location.find(position.last)
      user_passed(1,position.last)
      render json: {id: location.id, latitude: location.latitude,longitude: location.longitude, content: location.content, url: location.url, distance: position.first}
      return
    else
      render text: 'Not found!'
      return
    end
  end

  def user_passed(user_id,location_id)
    if params['user_id']
      user_id = params['user_id']
      location_id = params['id']
    end
    passed_array = User.find(user_id).passed
    if passed_array.index(location_id)==nil
       User.find(user_id).update(passed: passed_array.push(location_id))
    end
    if params['user_id']
      render json: 'OK'
      return
    end
  end

  def get_record
    render json: User.first.locations
    return
  end

  def get_passed
    render json: Location.where(id: User.first.passed)
    return
  end
end
