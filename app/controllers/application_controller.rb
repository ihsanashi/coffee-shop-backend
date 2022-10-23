class ApplicationController < ActionController::API
  SECRET = 'Cuppa San'

  def authentication
    # check if token is included in request before proceeding to a secure route
    decode_data = decode_token(request.headers["token"])

    # get user id from nested JSON
    user_data = decode_data.first.user_id unless !decode_data

    # find user from DB to ensure token validity
    user = User.find(user_data&.id)

    if user
      return true
    else
      render json: { message: 'Invalid credentials '}, status: :unprocessable_entity
      return false
    end
  end

  def encode_token(payload)
    JWT.encode(payload, SECRET, 'HS256')
  end

  def decode_token(token)
    begin
      JWT.decode(token, SECRET, true, { algorithm: 'HS256' })
    rescue => exception
      render json: exception
    end
  end
end
