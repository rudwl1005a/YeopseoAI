package com.ssafy.api.service;

import com.ssafy.api.request.*;
import com.ssafy.db.entity.User;

public interface UserService {

    User createUser(UserRegisterPostReq userRegisterInfo);

    void deleteUser(int userSeq);

    User updateUser(int userSeq, UserUpdatePostReq userUpdateInfo);

    User updateUserProfile(int userSeq, UserUpdateProfilePostReq userUpdateProfileInfo);

    User updateTemplate(int userSeq, UserUpdateTemplatePostReq userUpdateTemplateInfo);

    User updateDonation(int userSeq, int userRemind, UserUpdateDonationPostReq donationSeq);

    User selectUser(int userSeq);

    User selectUser(String userId);
}
