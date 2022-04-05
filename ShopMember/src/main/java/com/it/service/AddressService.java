package com.it.service;

import com.it.domain.AddressVO;

public interface AddressService {


	public void insert(AddressVO address);
	public AddressVO read(AddressVO address);
	public void update(AddressVO address);
	public void delete(AddressVO address);
}
