package poly.edu.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import poly.edu.entity.CartItem;

@SessionScope
@Service
public class ShoppingCartImpl implements ShoppingCartService {
	Map<Integer, CartItem> maps = new HashMap<>();

	@Override
	public double getAmount() {
		// TODO Auto-generated method stub
		return maps.values().stream().mapToDouble(item -> item.getQty() * item.getPrice()).sum();	
				}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return maps.values().size();
	}

	@Override
	public Collection<CartItem> getAllItems() {
		// TODO Auto-generated method stub
		return maps.values();
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		maps.clear();
	}

	@Override
	public CartItem update(int proID, int qty) {
		// TODO Auto-generated method stub
		CartItem cartItem = maps.get(proID);
		cartItem.setQty(qty);

		return cartItem;
	}

	@Override
	public void remove(int id) {
		// TODO Auto-generated method stub
		maps.remove(id);
	}

	@Override
	public void add(CartItem item) {
		// TODO Auto-generated method stub
		CartItem cartItem = maps.get(item.getProductId());
		if (cartItem == null) {
			maps.put(item.getProductId(), item);
		} else {
			cartItem.setQty(cartItem.getQty() + 1);
		}
	}

}
