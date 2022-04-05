package com.it.mapper;

import com.it.domain.AddressVO;

public interface AddressMapper {

	public void insert(AddressVO address);
	public AddressVO read(AddressVO address);
	public void update(AddressVO address);
	public void delete(AddressVO address);
}
