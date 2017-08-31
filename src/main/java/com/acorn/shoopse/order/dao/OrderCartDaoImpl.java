package com.acorn.shoopse.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.shoopse.order.dto.OrderActionDto;
import com.acorn.shoopse.order.dto.OrderCartDto;
import com.acorn.shoopse.users.dto.UsersDto;

@Repository
public class OrderCartDaoImpl implements OrderCartDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<OrderCartDto> getCartList(int mem_num) {
		List<OrderCartDto> cartList = session.selectList("cart.getList",mem_num);
		return cartList;
	}

	@Override
	public OrderCartDto itemCount(OrderCartDto dto) {
		session.update("cart.countUpdate",dto);//개수늘리고
		OrderCartDto cartDto = session.selectOne("cart.countSelect",dto);//json뿌리려면 셀릭트해온다
		return cartDto;
	}

	@Override
	public UsersDto getAddr(int mem_num) {
		UsersDto dto =session.selectOne("cart.getAddr",mem_num);
		return dto;
	}

	@Override
	public void orderInsert(OrderActionDto dto) {
		session.update("cart.orderUpdate",dto);
		session.insert("cart.reqAddrInsert",dto);
	}
}
