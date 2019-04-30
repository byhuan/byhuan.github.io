package cn.e3mall.mapper;

import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbItemMapper {
    int countByExample(TbItemExample example);

    int deleteByExample(TbItemExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbItem record);

    int insertSelective(TbItem record);

    List<TbItem> selectByExample(TbItemExample example);

    TbItem selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbItem record, @Param("example") TbItemExample example);

    int updateByExample(@Param("record") TbItem record, @Param("example") TbItemExample example);

    int updateByPrimaryKeySelective(TbItem record);

    int updateByPrimaryKey(TbItem record);
    
    //自定义的随机查商品
   	List<TbItem> selectItemList();
   	
   	//自定义的随机查热门商品
   	List<TbItem> selectHotItemList();
   	
  //自定义的随机查热卖商品
   	List<TbItem> selectHotMaiItemList();

   	//自定义查找分类相同商品
	List<TbItem> selectBuyItemList(Long cid);
}