package com.it.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.AddressVO;
import com.it.mapper.AddressMapper;

import lombok.Setter;

@Service
public class AddressServiceImpl implements AddressService{
	
	@Setter(onMethod_=@Autowired)
	private AddressMapper mapper;
	
	public void insert(AddressVO address) {
		mapper.insert(address);
	}
	public AddressVO read(AddressVO address) {
		return mapper.read(address);
	}
	public void update(AddressVO address) {
		mapper.update(address);
	}
	public void delete(AddressVO address) {
		mapper.delete(address);
	}

	
}
