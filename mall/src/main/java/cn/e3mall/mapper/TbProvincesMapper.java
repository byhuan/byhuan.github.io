package cn.e3mall.mapper;

import cn.e3mall.pojo.TbProvinces;
import cn.e3mall.pojo.TbProvincesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbProvincesMapper {
    int countByExample(TbProvincesExample example);

    int deleteByExample(TbProvincesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TbProvinces record);

    int insertSelective(TbProvinces record);

    List<TbProvinces> selectByExample(TbProvincesExample example);

    TbProvinces selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TbProvinces record, @Param("example") TbProvincesExample example);

    int updateByExample(@Param("record") TbProvinces record, @Param("example") TbProvincesExample example);

    int updateByPrimaryKeySelective(TbProvinces record);

    int updateByPrimaryKey(TbProvinces record);

    //查省所有
	List<TbProvinces> selectProList();
}