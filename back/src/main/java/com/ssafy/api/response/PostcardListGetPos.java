package com.ssafy.api.response;

import com.ssafy.common.customObj.PostcardList;
import com.ssafy.db.entity.Postcard;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@ApiModel("PostcardListGetResponse")
public class PostcardListGetPos {

    @ApiModelProperty(name="엽서 리스트", example="엽서 리스트...")
    List<PostcardList> postcardList;

    public static PostcardListGetPos of(List<PostcardList> postcardLists) {
        PostcardListGetPos postcardListGetPos = new PostcardListGetPos();
        postcardListGetPos.setPostcardList(postcardLists);

        return postcardListGetPos;
    }
}
