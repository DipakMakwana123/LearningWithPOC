//
//  APIConstant.swift
//  CodingStandardIOS
//
//  Created by Apple on 06/07/21.
//

enum  URLs : String {
    
    // MARK: Development URL's
     case  baseURL = "https://dev.par-go.com"//"https://65.0.11.205"
     case  socket = "http://65.1.112.26:5001"
    
    // MARK: Demo URL's
    //case  baseURL = "https://release.par-go.com"// "https://3.110.46.158"
//    case  socket = "http://3.6.94.169:5001"

    case  agoraURL = "https://api.agora.io/v1/apps"
    case  s3URL = "https://s3-ap-south-1.amazonaws.com/"
}

enum  EndPoints : String  {
  
    case  login = "/api/v1/users/sign_in"
    case  user  = "/api/v1/users"    
    case  forgotPassword  = "/api/v1/users/password"
    case  changePassword  = "/api/v1/users/change_password"
    case  invite = "/api/v1/invites"
    case  invite_friends = "/api/v1/users/invite_friends"
    case  logout = "/api/v1/users/sign_out"
    case  createCollabReq = "/api/v1/collab_requests"
    case  createShareReq = "/api/v1/shares"
    case  leave_share = "/leave_share"
    case  members = "/api/v1/members/"
    case  collabSession = "/api/v1/collab_sessions"
    case  collabRooms = "/api/v1/collab_rooms"
    case  sharedRooms = "/share_messages"
    case  contents = "/api/v1/contents"
    case  collabContents = "/api/v1/collab_sessions/"
    
    case  registerDeviceToken = "/api/v1/registerDeviceToken/"
    case  getFollowers = "/api/v1/follows"
    case  genres = "/api/v1/genres"
    case  notifications = "/api/v1/notifications"
    case  messages = "/api/v1/chat_messages"
    case  acquire = "cloud_recording/acquire"
    case  start  = "cloud_recording/resourceid/<resourceid>/mode/mix/start"
    case  getSelectedUsersFollowers = "/api/v1/follows/share_connections"
}
