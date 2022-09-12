package com.ssafy.api.service;

import com.ssafy.api.request.UserRegisterPostReq;
import com.ssafy.api.request.UserUpdatePostReq;
import com.ssafy.api.request.UserUpdateProfilePostReq;
import com.ssafy.db.entity.User;

public interface UserService {

    User createUser(UserRegisterPostReq userRegisterInfo);

    void deleteUser(int userSeq);

    User updateUser(int userSeq, UserUpdatePostReq userUpdateInfo);

    User updateUserProfile(int userSeq, UserUpdateProfilePostReq userUpdateProfileInfo);

    User selectUser(int userSeq);

    User selectUser(String userId);
}
