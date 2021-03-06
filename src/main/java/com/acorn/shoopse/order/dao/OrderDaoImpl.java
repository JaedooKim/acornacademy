package com.acorn.shoopse.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.shoopse.order.dto.OrderDto;
import com.acorn.shoopse.order.dto.OrderListDetailDto;
import com.acorn.shoopse.order.dto.WholeOrderDto;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<OrderDto> getList() {
		List<OrderDto> list = session.selectList("order.mgetList");
		
		return list;
	}

	@Override
	public OrderDto getData(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderDto mgetData(String id) {
		OrderDto dto = session.selectOne("order.mgetData", id);
		return dto;
	}

	@Override
	public void o_Insert(OrderDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<WholeOrderDto> orderGetList() {
		List<WholeOrderDto> list = session.selectList("manager.wholeOrderList");
		return list;
	}

	@Override
	public List<OrderListDetailDto> orderListDetail(int o_no) {
		List<OrderListDetailDto> list = session.selectList("manager.orderListDetail");
		
		return list;
	}
	
}
