module Secured
    def authenticate_user!
        #Bearer  xxxx
        token_regex = /Bearer (\w+)/
        # read header to auth
        headers = request.headers
        #verificar que sea valido
        if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
            token = headers['Authorization'].match(token_regex)[1];
            #verificar que el token que extraemos corresponda al token de un usuario
            #truthy falsy
            if (Current.user = User.find_by_auth_token(token))
                return
            end
        end
        render json: {error: 'unauthorized'}, status: :unauthorized
    end 
end