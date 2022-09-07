package com.ssafy.api.service;

import com.ssafy.api.request.UserRegisterPostReq;
import com.ssafy.api.request.UserUpdatePostReq;
import com.ssafy.api.request.UserUpdateProfilePostReq;
import com.ssafy.db.entity.User;
import com.ssafy.db.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service("UserService")
public class UserServiceImpl implements UserService{

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public User createUser(UserRegisterPostReq userRegisterInfo) {
        User user = new User();
        user.setUserId(userRegisterInfo.getUserId());
        user.setUserCode(userRegisterInfo.getUserCode());
        user.setUserEmail(userRegisterInfo.getUserEmail());
        user.setUserName(userRegisterInfo.getUserName());
        user.setUserPassword(userRegisterInfo.getUserPassword());
        user.setUserPhone(userRegisterInfo.getUserPhone());
        return userRepository.save(user);
    }

    @Override
    public void deleteUser(int userSeq) {
        userRepository.delete(selectUser(userSeq));
        return;
    }

    @Override
    public User updateUser(int userSeq, UserUpdatePostReq userUpdateInfo) {
        User user = selectUser(userSeq);
        user.setUserEmail(userUpdateInfo.getUserEmail());
        user.setUserPassword(userUpdateInfo.getUserPassword());
        user.setUserPhone(userUpdateInfo.getUserPhone());
        return userRepository.save(user);
    }

    @Override
    public User updateUserProfile(int userSeq, UserUpdateProfilePostReq userUpdateProfileInfo) {
        User user = selectUser(userSeq);
        user.setUserProfileUrl(userUpdateProfileInfo.getUserProfileUrl());
        return userRepository.save(user);
    }

    @Override
    public User selectUser(int userSeq) {
        User user = userRepository.findByUserSeq(userSeq);
        return user;
    }

    @Override
    public User selectUser(String userId) {
        User user = userRepository.findByUserId(userId);
        return user;
    }
}
