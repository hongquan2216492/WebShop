package home.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jdk.nashorn.internal.objects.annotations.Getter;
import ptithcm.entity.Cart;
import ptithcm.entity.CartItem;
import ptithcm.entity.Category;
import ptithcm.entity.Product;
import ptithcm.entity.User;

@Transactional
@Controller
public class MenuController {
	@Autowired
	SessionFactory factory;

	ServletContext context;

	User userLogin = null;
	User adminLogin = null;
	Cart cartUser = null;

	Integer cId, pId, pNum;
	String baseURL;
	String adminBaseURL;

	@ModelAttribute("baseURL")
	public String getBaseURL() {
		return baseURL;
	}
	@ModelAttribute("adminBaseURL")
	public String getAdminBaseURL() {
		return adminBaseURL;
	}

	@ModelAttribute("adminLogin")
	public User getAdminLogin() {
		return adminLogin;
	}

	@ModelAttribute("userLogin")
	public User getUserLogin() {
		return userLogin;
	}

	@ModelAttribute("users")
	public List<User> getUsers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		return list;
	}

	@ModelAttribute("categories")
	public List<Category> getCategories() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category WHERE display = true";/* ORDER BY cateName */
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}

	@ModelAttribute("allCategories")
	public List<Category> getAllCategories() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category";/* ORDER BY cateName */
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}

	@ModelAttribute("allProducts")
	public List<Product> getAllProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product ORDER BY name";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

	@ModelAttribute("products")
	public List<Product> getNewProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product WHERE display = true AND category.display = true";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		Collections.reverse(list);
		return list;
	}

	@ModelAttribute("recommendPros")
	public List<Product> getRecommendProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product WHERE display = true AND category.display = true";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		Collections.shuffle(list);
		return list;
	}

	// hang hot
	@ModelAttribute("featurePros")
	public List<CartItem> getFeatureProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CartItem WHERE quantity >= 10 AND product.display = true AND product.category.display = true ORDER BY quantity DESC";
		Query query = session.createQuery(hql);
		List<CartItem> list = query.list();
		return list;
	}

	public List<Cart> getOrder(Integer userId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session
					.createQuery("FROM Cart WHERE user.id = :userId AND buyDate is not null AND status is not null");
			query.setInteger("userId", userId);
			List<Cart> list = query.list();
			Collections.reverse(list);
			transaction.commit();
			return list;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public User checkUserName(String uname) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM User WHERE username = :uname");
			query.setString("uname", uname);
			User obj = (User) query.uniqueResult();
			transaction.commit();
			return obj;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public User login(String uname, String passwd) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM User WHERE username = :uname AND password = :passwd");
			query.setString("uname", uname);
			query.setString("passwd", passwd);
			User obj = (User) query.uniqueResult();
			transaction.commit();
			return obj;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public Cart getCart(Integer userId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM Cart WHERE user.id = :userId AND buyDate is null");
			query.setInteger("userId", userId);
			Cart obj = (Cart) query.uniqueResult();
			transaction.commit();
			return obj;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public Long getTotalCartItem(Integer cartId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("SELECT count(*) FROM CartItem WHERE cart.id = :cartId");
			query.setInteger("cartId", cartId);
			Long total = (Long) query.uniqueResult();
			transaction.commit();
			return total;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public Double getTotalPriceCart(Integer cartId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("SELECT SUM(unitPrice * quantity) FROM CartItem WHERE cart.id = :cartId");
			query.setInteger("cartId", cartId);
			Double total = (Double) query.uniqueResult();
			transaction.commit();
			return total;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public List<Product> getSimilarPro(Integer cateId, Product pro) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery(
					"FROM Product WHERE category.cateId = :cateId AND display = true AND category.display = true");
			query.setInteger("cateId", cateId);
			List<Product> list = query.list();

			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getId() == pro.getId()) {
					list.remove(i);
				}
			}
			transaction.commit();
			return list;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public List<CartItem> getCartItems(Integer cartId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM CartItem WHERE cart.id = :cartId");
			query.setInteger("cartId", cartId);
			List<CartItem> list = query.list();
			transaction.commit();
			return list;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String showIndex(ModelMap model) {
		baseURL = "index";

		// model.addAttribute("baseURL", baseURL);

		model.addAttribute("cartItem", new CartItem());

		// model.addAttribute("userLogin", userLogin);

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);
				}
			}
		}

		return "user/index";
	}

	@RequestMapping(value = "signout", method = RequestMethod.GET)
	public String signOut(ModelMap model) {
		userLogin = null;
		return "redirect:/index.html";
	}

	/*
	 * @RequestMapping(value = "search", method = RequestMethod.GET) public String
	 * search(ModelMap model) { model.addAttribute("product", new Product()); return
	 * "user/search"; }
	 */

	/*
	 * @RequestMapping(value = "search-product", method = RequestMethod.POST) public
	 * void search(@RequestParam("searchProduct") String search) {
	 * System.out.println("asdasdasdasd"); System.out.println("search: " + search);
	 * }
	 */

	/*
	 * @RequestMapping(value = "search", method = RequestMethod.GET) public
	 * List<Product> search(ModelMap model, @RequestParam(value = "keyword") String
	 * keyword) { baseURL = "search"; List<Product> listProduct =
	 * SearchProduct(keyword); model.addAttribute("product", list); return
	 * "user/search"; }
	 * 
	 * 
	 * @ModelAttribute("searchProduct") public List<Product> SearchProduct(string
	 * keyword) { Session session = factory.openSession(); Transaction transaction =
	 * null; try { transaction = session.beginTransaction(); String hql =
	 * "from Product where description like :keyword"; Query query =
	 * session.createQuery(hql); query.setParameter("keyword", "%" + keyword + "%");
	 * 
	 * List<Product> listProducts = query.list();
	 * 
	 * Query query =
	 * session.createQuery("FROM Products WHERE Name LIKE N'%keyword%'");
	 * List<Product> listProduct = query.list();
	 * 
	 * transaction.commit(); return listProducts; } catch (Exception ex) { if
	 * (transaction != null) { System.out.println(ex.toString());
	 * transaction.rollback(); } ex.printStackTrace(); } finally { session.flush();
	 * session.close(); } return null; }
	 */

	@RequestMapping(value = "signin", method = RequestMethod.GET)
	public String showLogin(ModelMap model) {
		model.addAttribute("user", new User());
		return "user/signin";
	}

	@RequestMapping(value = "signin", method = RequestMethod.POST)
	public String signIn(ModelMap model, @ModelAttribute("user") User user, BindingResult errors) {
		User tempUser;
		if (user.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "user", "Vui lòng nhập tên đăng nhập!");
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Vui lòng nhập mật khẩu!");
		}
		if (errors.hasErrors()) {
			return "user/signin";
		} else {
			System.out.println(user.getUsername() + " - " + user.getPassword());
			tempUser = login(user.getUsername(), user.getPassword());
			if (tempUser == null) {
				model.addAttribute("user", new User());
				model.addAttribute("msg", "Tên tài khoản hoặc mật khẩu không chính xác !");
				return "user/signin";
			} else {
				if (tempUser.isLock()) {
					model.addAttribute("user", new User());
					model.addAttribute("msg", "Tài khoản bị khóa vui lòng liên hệ với admin !");
					return "user/signin";
				} else {
					if (tempUser.getRoleId() == 1) {
						adminLogin = tempUser;
						userLogin = tempUser;
					} else {
						userLogin = tempUser;
					}
				}
			}
		}
		if (baseURL.equals("category")) {
			return "redirect:/category/" + cId + "/" + pNum + ".html";
		}
		if (baseURL.equals("shop")) {
			return "redirect:/shop/" + pNum + ".html";
		}
		if (baseURL.equals("single")) {
			return "redirect:/single/" + pId + ".html";
		}
		if (baseURL.equals("checkout")) {
			return "redirect:/checkout.html";
		}
		if (baseURL.equals("payment")) {
			return "redirect:/payment.html";
		}
		if (baseURL.equals("search")) {
			return "redirect:/search.html";
		}
		if (baseURL.equals("order")) {
			return "redirect:/order.html";
		} else {

			if (tempUser.getRoleId() == 1) {
				return "redirect:/admin/user/1.html";
			}

			return "redirect:/index.html";
		}
	}

	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String showProfile(ModelMap model) {

		return "user/profile";
	}

	@RequestMapping(value = "user/edit/{id}", method = RequestMethod.GET)
	public String showProfile(@PathVariable("id") Integer id, ModelMap model) {
		model.addAttribute("user", userLogin);
		return "user/profile";
	}

	/* @RequestParam("photo") MultipartFile photo, */
	@RequestMapping(value = "user/edit/{id}", method = RequestMethod.POST)
	public String edit(ModelMap model, @ModelAttribute("user") User user, BindingResult errors,
			HttpServletRequest request) {
		String pass = "", newPass = "", confirmNewPass = "";

		pass = request.getParameter("pass");
		newPass = request.getParameter("newPassword");
		confirmNewPass = request.getParameter("confirmNewPass");
		if (pass.isEmpty()) {
			model.addAttribute("mess0", "Vui lòng nhập mật khẩu cũ!");
			return "user/profile";
		}
		if (newPass.isEmpty() && !confirmNewPass.isEmpty()) {
			model.addAttribute("mess1", "Vui lòng nhập mật khẩu mới!");
			return "user/profile";
		}
		if (!newPass.equals(confirmNewPass)) {
			model.addAttribute("mess2", "Xác nhận mật khẩu mới không khớp !");
			return "user/profile";
		}
		if (!pass.equals(user.getPassword())) {
			errors.rejectValue("password", "user", "Mật khẩu cũ không chính xác!");
			return "user/profile";
		}
		if (!pass.isEmpty() && newPass.isEmpty() && confirmNewPass.isEmpty()) {
			pass = user.getPassword();
			System.out.println(user.getPassword());
		}
		if (!pass.isEmpty() && !newPass.isEmpty() && !confirmNewPass.isEmpty()) {
			pass = newPass;
		}
//		if (errors.hasErrors()) {
//			model.addAttribute("message", "Vui lÃ²ng sá»­a cÃ¡c lá»—i !");
//		} else {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		context = request.getSession().getServletContext();

		try {

			user.setPassword(pass);
			session.update(user);
			t.commit();

			TimeUnit.SECONDS.sleep(5);

			model.addAttribute("message", "Sửa thành công !");
			if (user.getRoleId() == 1) {
				adminLogin = user;
			} else {
				userLogin = user;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
			model.addAttribute("msg", "Sửa thất bại !\n" + e.toString());
		} finally {
			session.close();
		}
//		}

		return "user/profile";
	}

	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String showRegister(ModelMap model) {
		model.addAttribute("user", new User());
		return "user/signup";
	}

	public boolean checkPhoneNumber(String number) {
		Pattern pattern = Pattern.compile("^[0-9]*$");
		Matcher matcher = pattern.matcher(number);
		if (!matcher.matches()) {
			return false;
		} else {
			if (number.length() != 10) {
				return false;
			} else {
				if (!number.startsWith("03") && !number.startsWith("05") && !number.startsWith("07")
						&& !number.startsWith("08") && !number.startsWith("09")) {
					return false;
				}
			}
		}
		return true;
	}

	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signUp(ModelMap model, @ModelAttribute("user") User user, BindingResult errors) {
		if (!checkPhoneNumber(user.getPhone())) {
			errors.rejectValue("phone", "user", "Số điện thoại sai định dạng");
		}
		if (checkUserName(user.getUsername()) != null) {
			errors.rejectValue("username", "user", "Tên đăng nhập đã tồn tại!");
		}
		if (!errors.hasErrors()) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(user);
				model.addAttribute("message", "Đăng kí thành công !");

				userLogin = user;
				Cart cart = new Cart();
				cart.setUser(user);
				session.save(cart);

				t.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				t.rollback();
				model.addAttribute("msg", "Đăng kí thất bại !\n" + e.toString());
			} finally {
				session.close();
			}
		}
		return "user/signup";
	}

	public List<Product> getListNav(int start, int limit) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session
					.createQuery("FROM Product WHERE display = true AND category.display = true ORDER BY id DESC");
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<Product> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public int totalItem() {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session
					.createQuery("SELECT count(*) FROM Product WHERE display = true AND category.display = true");
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	public List<Product> getListNavByCate(int start, int limit, int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery(
					"FROM Product WHERE category.cateId =:id AND display = true AND category.display = true ORDER BY id DESC");
			query.setParameter("id", id);
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<Product> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public int totalItemByCate(int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery(
					"SELECT count(*) FROM Product WHERE category.cateId =:id AND display = true AND category.display = true");
			query.setParameter("id", id);
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	@RequestMapping(value = "shop/{page}", method = RequestMethod.GET)
	public String viewProductListByPage(ModelMap model, @PathVariable("page") int page) {

		baseURL = "shop";

		pNum = page;

		int productCountPerPage = 12;

		// model.addAttribute("baseURL", baseURL);

		model.addAttribute("listProduct", getListNav((page - 1) * productCountPerPage, productCountPerPage));
		model.addAttribute("totalPage", (totalItem() % productCountPerPage == 0) ? totalItem() / productCountPerPage
				: totalItem() / productCountPerPage + 1);
		model.addAttribute("currentPage", page);
		model.addAttribute("isCate", 0);

		model.addAttribute("cartItem", new CartItem());
		// model.addAttribute("userLogin", userLogin);

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);
				}
			}
		}

		return "user/shop";
	}

	@RequestMapping(value = "category/{id}/{page}", method = RequestMethod.GET)
	public String viewProductListByPageAndCate(ModelMap model, @PathVariable("id") int id,
			@PathVariable("page") int page) {

		baseURL = "category";

		pNum = page;
		cId = id;

		int productCountPerPage = 12;

		Session session = factory.getCurrentSession();

		// model.addAttribute("baseURL", baseURL);

		model.addAttribute("listProduct", getListNavByCate((page - 1) * productCountPerPage, productCountPerPage, id));
		model.addAttribute("totalPage",
				(totalItemByCate(id) % productCountPerPage == 0) ? totalItemByCate(id) / productCountPerPage
						: totalItemByCate(id) / productCountPerPage + 1);
		model.addAttribute("currentPage", page);
		model.addAttribute("isCate", 1);
		model.addAttribute("cateId", id);

		Category category = (Category) session.get(Category.class, id);
		model.addAttribute("category", category);

		model.addAttribute("cartItem", new CartItem());
		// model.addAttribute("userLogin", userLogin);

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);
				}
			}
		}

		return "user/shop";
	}

	@RequestMapping(value = "single/{id}", method = RequestMethod.GET)
	public String productDetail(ModelMap model, @PathVariable("id") int id) {
		baseURL = "single";
		pId = id;
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("product", product);
		model.addAttribute("similarPros", getSimilarPro(product.getCategory().getCateId(), product));
		model.addAttribute("cartItem", new CartItem());

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);
				}
			}
		}

		return "user/single";
	}

	public CartItem checkExistCartItem(Integer cartId, Integer proId) {
		Session session = factory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("FROM CartItem WHERE cartId = :cartId AND proId = :proId");
			query.setInteger("cartId", cartId);
			query.setInteger("proId", proId);
			CartItem obj = (CartItem) query.uniqueResult();
			transaction.commit();
			return obj;
		} catch (Exception ex) {
			if (transaction != null) {
				System.out.println(ex.toString());
				transaction.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	@RequestMapping(value = "cart/insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("cartItem") CartItem ci) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			CartItem ci_temp = checkExistCartItem(cartUser.getId(), ci.getProduct().getId());
			if (ci_temp != null) {
				ci_temp.setQuantity(ci_temp.getQuantity() + ci.getQuantity());
				session.merge(ci_temp);
				t.commit();
			} else {
				session.save(ci);
				t.commit();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.flush();
			session.close();
		}
		if (baseURL.equals("category")) {
			return "redirect:/category/" + cId + "/" + pNum + ".html";
		}
		if (baseURL.equals("shop")) {
			return "redirect:/shop/" + pNum + ".html";
		}
		if (baseURL.equals("single")) {
			return "redirect:/single/" + pId + ".html";
		}
		if (baseURL.equals("checkout")) {
			return "redirect:/checkout.html";
		}
		if (baseURL.equals("search")) {
			return "redirect:/search.html";
		}
		if (baseURL.equals("payment")) {
			return "redirect:/payment.html";
		}
		if (baseURL.equals("order")) {
			return "redirect:/order.html";
		} else {
			return "redirect:/index.html";
		}
	}

	@RequestMapping(value = "cart/delete/{id}", method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.openSession();
		CartItem ci = (CartItem) session.get(CartItem.class, id);
		Transaction t = session.beginTransaction();
		try {
			session.delete(ci);
			t.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.close();
		}
		if (baseURL.equals("category")) {
			return "redirect:/category/" + cId + "/" + pNum + ".html";
		}
		if (baseURL.equals("shop")) {
			return "redirect:/shop/" + pNum + ".html";
		}
		if (baseURL.equals("single")) {
			return "redirect:/single/" + pId + ".html";
		}
		if (baseURL.equals("checkout")) {
			return "redirect:/checkout.html";
		}
		if (baseURL.equals("search")) {
			return "redirect:/search.html";
		}
		if (baseURL.equals("payment")) {
			return "redirect:/payment.html";
		}
		if (baseURL.equals("order")) {
			return "redirect:/order.html";
		} else {
			return "redirect:/index.html";
		}
	}

	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public String checkout(ModelMap model) {
		baseURL = "checkout";
		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cart.setName(userLogin.getName());
				cart.setPhone(userLogin.getPhone());
				cart.setAddress(userLogin.getAddress());
				cart.setEmail(userLogin.getEmail());
				cartUser = cart;
				List<CartItem> list = getCartItems(cart.getId());
				model.addAttribute("cart", cart);

				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", cart.getCartItems());
				}
			}
		}
		return "user/checkout";
	}

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public String checkout(ModelMap model, @ModelAttribute("cart") Cart cart, BindingResult errors) {
		if (!checkPhoneNumber(cart.getPhone())) {
			errors.rejectValue("phone", "cart", "Số điện thoại sai định dạng");
		}
		if (errors.hasErrors()) {
			return "redirect:/checkout.html";
		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();

			try {
				session.update(cart);
				for (CartItem ci : cart.getCartItems()) {
					session.update(ci);
				}
				t.commit();
			} catch (Exception e) {
				System.out.println(e.toString());
				t.rollback();
			} finally {
				session.close();
			}
			return "redirect:/payment.html";
		}

	}

	@RequestMapping(value = "payment", method = RequestMethod.GET)
	public String payment(ModelMap model) {
		baseURL = "payment";

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));
			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);
				}
			}
		}
		return "user/payment";
	}

	@RequestMapping(value = "payment", method = RequestMethod.POST)
	public String payment(ModelMap model, @ModelAttribute("cart") Cart c) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			c.setBuyDate(new Date());
			session.saveOrUpdate(c);

			Cart cart = new Cart();
			cart.setUser(userLogin);
			session.save(cart);

			t.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.flush();
			session.close();
		}
		return "redirect:/index.html";
	}

//	@RequestMapping(value = "checkout/{mp}/{proId}", method = RequestMethod.GET)
//	public String minusPlus(ModelMap model, @PathVariable("proId") Integer proId, @PathVariable("mp") String mp) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		try {
//			CartItem ci_temp = checkExistCartItem(cartUser.getId(), proId);
//			if (ci_temp != null) {
//				if (mp.equals("minus")) {
//					if (ci_temp.getQuantity() == 1) {
//						ci_temp.setQuantity(1);
//					} else {
//						ci_temp.setQuantity(ci_temp.getQuantity() - 1);
//					}
//				} else {
//					ci_temp.setQuantity(ci_temp.getQuantity() + 1);
//				}
//				
//				session.merge(ci_temp);
//				t.commit();
//			} else {
////				session.save(ci);
////				t.commit();
//			}
//		} catch (Exception e) {
//			System.out.println(e.toString());
//			t.rollback();
//		} finally {
//			session.flush();
//			session.close();
//		}
//		if (baseURL.equals("category")) {
//			return "redirect:/category/" + cId + "/" + pNum + ".html";
//		}
//		if (baseURL.equals("shop")) {
//			return "redirect:/shop/" + pNum + ".html";
//		}
//		if (baseURL.equals("single")) {
//			return "redirect:/single/" + pId + ".html";
//		}
//		if (baseURL.equals("checkout")) {
//			return "redirect:/checkout.html";
//		}
//		if (baseURL.equals("payment")) {
//			return "redirect:/payment.html";
//		}
//		if (baseURL.equals("order")) {
//			return "redirect:/order.html";
//		} else {
//			return "redirect:/index.html";
//		}
//	}
//	@RequestMapping(value = "checkout/edit/{cartId}", method = RequestMethod.GET)
//	public String editCart(ModelMap model) {
//		model.addAttribute("cart",getCart(userLogin.getId()));
//		return "checkout";
//	}
//	@RequestMapping(value = "checkout/editCart", method = RequestMethod.GET)
//	public String minusPlus(ModelMap model,model) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		try {
//			CartItem ci_temp = checkExistCartItem(cartUser.getId(), proId);
//			if (ci_temp != null) {
//				if (mp.equals("minus")) {
//					if (ci_temp.getQuantity() == 1) {
//						ci_temp.setQuantity(1);
//					} else {
//						ci_temp.setQuantity(ci_temp.getQuantity() - 1);
//					}
//				} else {
//					ci_temp.setQuantity(ci_temp.getQuantity() + 1);
//				}
//
//				session.merge(ci_temp);
//				t.commit();
//			} else {
////				session.save(ci);
////				t.commit();
//			}
//		} catch (Exception e) {
//			System.out.println(e.toString());
//			t.rollback();
//		} finally {
//			session.flush();
//			session.close();
//		}
//		if (baseURL.equals("category")) {
//			return "redirect:/category/" + cId + "/" + pNum + ".html";
//		}
//		if (baseURL.equals("shop")) {
//			return "redirect:/shop/" + pNum + ".html";
//		}
//		if (baseURL.equals("single")) {
//			return "redirect:/single/" + pId + ".html";
//		}
//		if (baseURL.equals("checkout")) {
//			return "redirect:/checkout.html";
//		}
//		if (baseURL.equals("payment")) {
//			return "redirect:/payment.html";
//		}
//		if (baseURL.equals("order")) {
//			return "redirect:/order.html";
//		} else {
//			return "redirect:/index.html";
//		}
//	}

	@RequestMapping(value = "order", method = RequestMethod.GET)
	public String order(ModelMap model) {
		baseURL = "order";

		if (userLogin != null) {
			model.addAttribute("orders", getOrder(userLogin.getId()));

			Cart cart = getCart(userLogin.getId());
			if (cart == null) {

			} else {
				cartUser = cart;
				model.addAttribute("cart", cart);
				List<CartItem> list = getCartItems(cart.getId());
				if (list == null) {

				} else {
					model.addAttribute("totalItem", getTotalCartItem(cart.getId()));
					model.addAttribute("totalPrice", getTotalPriceCart(cart.getId()));
					model.addAttribute("listCartItem", list);
				}
			}
		}
		return "user/order";
	}

	@RequestMapping(value = "order/{action}/{id}", method = RequestMethod.GET)
	public String cancelOrder(ModelMap model, @PathVariable String action, @PathVariable Integer id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Cart cart = (Cart) session.get(Cart.class, id);
		try {
			if (action.equals("cancel")) {
				cart.setStatus(3);
			}
			if (action.equals("received")) {
				cart.setStatus(2);
			}
			if (action.equals("repurchase")) {
				cart.setStatus(0);
			}
			session.update(cart);
			t.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			t.rollback();
		} finally {
			session.flush();
			session.close();
		}
		return "redirect:/order.html";
	}

	@RequestMapping("about")
	public String aboutUs() {
		return "user/about";
	}

	@RequestMapping("404")
	public String error() {
		return "user/404";
	}

	@RequestMapping("contact")
	public String contact() {
		return "user/contact";
	}

	@RequestMapping("customer")
	public String customer() {
		return "user/customer";
	}

	// admin
	// product
	public List<Product> getListNavAllPro(int start, int limit) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("FROM Product ORDER BY id DESC");
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<Product> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public int totalAllItem() {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM Product");
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();// Ã©p kiá»ƒu sang int
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	@RequestMapping(value = "admin/{id}", method = RequestMethod.GET)
	public String admin(ModelMap model, @PathVariable Integer id) {
		Session session = factory.getCurrentSession();
		User admin = (User) session.get(User.class, id);
		adminLogin = admin;
		return "redirect:/admin/user/1.html";
	}

	@RequestMapping(value = "admin/product/{page}", method = RequestMethod.GET)
	public String productConfig(ModelMap model, @PathVariable Integer page) {
		adminBaseURL = "admin/product";

		pNum = page;

		int productCountPerPage = 6;

		model.addAttribute("adminBaseURL", adminBaseURL);

		model.addAttribute("listProduct", getListNavAllPro((page - 1) * productCountPerPage, productCountPerPage));
		model.addAttribute("totalPage",
				(totalAllItem() % productCountPerPage == 0) ? totalAllItem() / productCountPerPage
						: totalAllItem() / productCountPerPage + 1);
		model.addAttribute("currentPage", page);

		// model.addAttribute("adminLogin", adminLogin);

		return "admin/product/index";
	}

	@RequestMapping(value = "admin/product/insert", method = RequestMethod.GET)
	public String insertProduct(ModelMap model) {
		adminBaseURL = "admin/product/insert";
		model.addAttribute("adminBaseURL", adminBaseURL);

		model.addAttribute("product", new Product());
		return "admin/product/insert";
	}

	@RequestMapping(value = "admin/product/insert", method = RequestMethod.POST)
	public String insertProduct(ModelMap model, @ModelAttribute("product") Product product,
			@RequestParam("photo") MultipartFile photo, BindingResult errors, HttpServletRequest request) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		context = request.getSession().getServletContext();

		try {

			if (!photo.isEmpty()) {
				String photoPath = context.getRealPath("/images/product-image/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));

				product.setImage("images/product-image/" + photo.getOriginalFilename());
			}

			session.save(product);
			t.commit();

			TimeUnit.SECONDS.sleep(5);

			model.addAttribute("message", "Thêm mới thành công !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("msg", "Thêm mới thất bại !\n" + e.toString());
		} finally {
			session.close();
		}

		return "admin/product/insert";
	}

	@RequestMapping(value = "admin/product/edit/{id}", method = RequestMethod.GET)
	public String editProduct(ModelMap model, @PathVariable("id") Integer id) {
		adminBaseURL = "admin/product/edit";
		model.addAttribute("adminBaseURL", adminBaseURL);

		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);

		model.addAttribute("product", product);
		return "admin/product/edit";
	}

	@RequestMapping(value = "admin/product/edit/{id}", method = RequestMethod.POST)
	public String editProduct(ModelMap model, @ModelAttribute("product") Product product,
			@RequestParam("photo") MultipartFile photo, BindingResult errors, HttpServletRequest request) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		context = request.getSession().getServletContext();

		try {

			if (!photo.isEmpty()) {
				String photoPath = context.getRealPath("/images/product-image/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));

				product.setImage("images/product-image/" + photo.getOriginalFilename());
			}

			session.update(product);
			t.commit();

			TimeUnit.SECONDS.sleep(5);

			model.addAttribute("message", "Sửa thành công !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("msg", "Sửa thất bại !\n" + e.toString());
		} finally {
			session.close();
		}

		return "admin/product/edit";
	}

	@RequestMapping(value = "admin/product/delete/{id}", method = RequestMethod.GET)
	public String deleteProduct(ModelMap model, @PathVariable("id") Integer id) {

		Session session = factory.openSession();
		Product product = (Product) session.get(Product.class, id);
		Transaction t = session.beginTransaction();
		try {
			session.delete(product);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "redirect:/admin/product/" + pNum + ".html";
	}

	// display product
	@RequestMapping(value = "admin/product/display/{id}", method = RequestMethod.GET)
	public String displayProduct(ModelMap model, @PathVariable("id") Integer id) {

		Session session = factory.openSession();
		Product product = (Product) session.get(Product.class, id);
		Transaction t = session.beginTransaction();
		try {
			if (product.isDisplay()) {
				product.setDisplay(false);
			} else {
				product.setDisplay(true);
			}
			session.update(product);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "redirect:/admin/product/" + pNum + ".html";
	}

	// category
	public List<Category> getListNavAllCate(int start, int limit) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("FROM Category ORDER BY cateId DESC");
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<Category> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public int totalAllCate() {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM Category");
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	@RequestMapping(value = "admin/category/{page}", method = RequestMethod.GET)
	public String categoryConfig(ModelMap model, @PathVariable Integer page) {
		adminBaseURL = "admin/category";

		pNum = page;

		int productCountPerPage = 6;

		model.addAttribute("adminBaseURL", adminBaseURL);

		model.addAttribute("listCategory", getListNavAllCate((page - 1) * productCountPerPage, productCountPerPage));
		model.addAttribute("totalPage",
				(totalAllCate() % productCountPerPage == 0) ? totalAllCate() / productCountPerPage
						: totalAllCate() / productCountPerPage + 1);
		model.addAttribute("currentPage", page);

		// model.addAttribute("adminLogin", adminLogin);

		return "admin/category/index";
	}

	@RequestMapping(value = "admin/category/insert", method = RequestMethod.GET)
	public String insertCategory(ModelMap model) {
		adminBaseURL = "admin/category/insert";
		model.addAttribute("adminBaseURL", adminBaseURL);

		model.addAttribute("category", new Category());
		return "admin/category/insert";
	}

	@RequestMapping(value = "admin/category/insert", method = RequestMethod.POST)
	public String insertCategory(ModelMap model, @ModelAttribute("category") Category category,
			@RequestParam("photo") MultipartFile photo, BindingResult errors, HttpServletRequest request) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		context = request.getSession().getServletContext();

		try {

			if (!photo.isEmpty()) {
				String photoPath = context.getRealPath("/images/category-image/" + photo.getOriginalFilename());
				// String photoPath = "D:\\Java
				// WEB\\project\\WebShop\\WebContent\\images\\category-image\\" +
				// photo.getOriginalFilename();
				photo.transferTo(new File(photoPath));
				// System.out.print(photo);

				category.setCateImage("images/category-image/" + photo.getOriginalFilename());
			}

			session.save(category);
			t.commit();

			TimeUnit.SECONDS.sleep(5);

			model.addAttribute("message", "Thêm mới thành công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("msg", "Thêm mới thất bại !\n" + e.toString());
		} finally {
			session.close();
		}

		return "admin/category/insert";
	}

	@RequestMapping(value = "admin/category/edit/{id}", method = RequestMethod.GET)
	public String editCategory(ModelMap model, @PathVariable("id") Integer id) {
		adminBaseURL = "admin/category/edit";
		model.addAttribute("adminBaseURL", adminBaseURL);

		Session session = factory.getCurrentSession();
		Category category = (Category) session.get(Category.class, id);

		model.addAttribute("category", category);
		return "admin/category/edit";
	}

	@RequestMapping(value = "admin/category/edit/{id}", method = RequestMethod.POST)
	public String editProduct(ModelMap model, @ModelAttribute("category") Category category,
			@RequestParam("photo") MultipartFile photo, BindingResult errors, HttpServletRequest request) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		context = request.getSession().getServletContext();

		try {

			if (!photo.isEmpty()) {
				String photoPath = context.getRealPath("/images/category-image/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));

				category.setCateImage("images/category-image/" + photo.getOriginalFilename());
			}

			session.update(category);
			t.commit();

			TimeUnit.SECONDS.sleep(5);

			model.addAttribute("message", "Sửa thành công !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("msg", "Sửa thất bại!\n" + e.toString());
		} finally {
			session.close();
		}

		return "admin/category/edit";
	}

	@RequestMapping(value = "admin/category/delete/{id}", method = RequestMethod.GET)
	public String deleteCategory(ModelMap model, @PathVariable("id") Integer id) {

		Session session = factory.openSession();
		Category category = (Category) session.get(Category.class, id);
		Transaction t = session.beginTransaction();
		try {
			session.delete(category);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "redirect:/admin/category/" + pNum + ".html";
	}

	@RequestMapping(value = "admin/category/display/{id}", method = RequestMethod.GET)
	public String displayCategory(ModelMap model, @PathVariable("id") Integer id) {

		Session session = factory.openSession();
		Category category = (Category) session.get(Category.class, id);
		Transaction t = session.beginTransaction();
		try {
			if (category.isDisplay()) {
				category.setDisplay(false);
			} else {
				category.setDisplay(true);
			}
			session.update(category);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "redirect:/admin/category/" + pNum + ".html";
	}

	// user
	public List<User> getListNavAllUser(int start, int limit) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("FROM User ORDER BY id DESC");
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<User> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public int totalAllUser() {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM User");
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	@RequestMapping(value = "admin/user/{page}", method = RequestMethod.GET)
	public String userConfig(ModelMap model, @PathVariable Integer page) {
		adminBaseURL = "admin/user";

		pNum = page;

		int productCountPerPage = 6;

		model.addAttribute("adminBaseURL", adminBaseURL);

		model.addAttribute("listUser", getListNavAllUser((page - 1) * productCountPerPage, productCountPerPage));
		model.addAttribute("totalPage",
				(totalAllUser() % productCountPerPage == 0) ? totalAllUser() / productCountPerPage
						: totalAllUser() / productCountPerPage + 1);
		model.addAttribute("currentPage", page);

		// model.addAttribute("adminLogin", adminLogin);

		return "admin/user/index";
	}

	@RequestMapping(value = "admin/user/insert", method = RequestMethod.GET)
	public String insertUser(ModelMap model) {
		adminBaseURL = "admin/user/insert";
		model.addAttribute("adminBaseURL", adminBaseURL);

		model.addAttribute("user", new User());
		return "admin/user/insert";
	}

	/* @RequestParam("photo") MultipartFile photo, */
	@RequestMapping(value = "admin/user/insert", method = RequestMethod.POST)
	public String insertUser(ModelMap model, @ModelAttribute("user") User user, BindingResult errors,
			HttpServletRequest request) {
		if (!checkPhoneNumber(user.getPhone())) {
			errors.rejectValue("phone", "user", "Số điện thoại sai định dạng");
		}

		if (checkUserName(user.getUsername()) != null) {
			errors.rejectValue("username", "user", "Tên đăng nhập đã tồn tại!");
		}

		if (!errors.hasErrors()) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();

			context = request.getSession().getServletContext();

			try {

				session.save(user);
				Cart cart = new Cart();
				cart.setUser(user);
				session.save(cart);

				t.commit();

				TimeUnit.SECONDS.sleep(5);

				model.addAttribute("message", "Thêm thành công !");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("msg", "Thêm thất bại !\n" + e.toString());
			} finally {
				session.close();
			}
		}

		return "admin/user/insert";
	}

	@RequestMapping(value = "admin/user/edit/{id}", method = RequestMethod.GET)
	public String editUser(ModelMap model, @PathVariable("id") Integer id) {
		adminBaseURL = "admin/user/edit";
		model.addAttribute("adminBaseURL", adminBaseURL);

		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, id);

		model.addAttribute("user", user);
		return "admin/user/edit";
	}

	/* @RequestParam("photo") MultipartFile photo, */
	@RequestMapping(value = "admin/user/edit/{id}", method = RequestMethod.POST)
	public String editProduct(ModelMap model, @ModelAttribute("user") User user, BindingResult errors,
			HttpServletRequest request) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		context = request.getSession().getServletContext();

		try {

			session.update(user);
			t.commit();

			TimeUnit.SECONDS.sleep(5);

			model.addAttribute("message", "Sửa thành công !");
			if (user.getId() == adminLogin.getId()) {
				adminLogin = user;
			} else {
				if (userLogin.getId() == user.getId()) {
					userLogin = user;
				}
			}
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("msg", "Sửa thất bại !\n" + e.toString());
		} finally {
			session.close();
		}

		return "admin/user/edit";
	}

	@RequestMapping(value = "admin/user/delete/{id}", method = RequestMethod.GET)
	public String deleteUser(ModelMap model, @PathVariable("id") Integer id) {

		Session session = factory.openSession();
		User user = (User) session.get(User.class, id);
		// int userid=user.getId();
		// Query query = session.createQuery("FROM Carts as carts WHERE carts.UserId="+
		// id);
		// List<Cart> list = query.list();
		// int i=0;
		// Cart ci = (Cart) session.get(Cart.class, userid);
		Transaction t = session.beginTransaction();
		try {
			/*
			 * while(list!=null) { session.delete(list.get(i)); i++; }
			 */
			session.delete(user);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "redirect:/admin/user/" + pNum + ".html";
		/*
		 * Session session = factory.openSession(); User user = (User)
		 * session.get(User.class, id); Transaction t = session.beginTransaction(); try
		 * { session.delete(user); t.commit(); } catch (Exception e) { t.rollback(); }
		 * finally { session.close(); }
		 * 
		 * 
		 * return "redirect:/admin/user/" + pNum + ".html";
		 */
	}

	@RequestMapping(value = "admin/user/lock/{id}", method = RequestMethod.GET)
	public String lockUser(ModelMap model, @PathVariable("id") Integer id) {

		Session session = factory.openSession();
		User user = (User) session.get(User.class, id);
		Transaction t = session.beginTransaction();
		try {
			if (user.isLock()) {
				user.setLock(false);
			} else {
				user.setLock(true);
			}
			session.update(user);
			t.commit();

		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "redirect:/admin/user/" + pNum + ".html";
	}

	// order
	public List<Cart> getListNavAllOrder(int start, int limit) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("FROM Cart WHERE buyDate IS NOT NULL ORDER BY id DESC");
			query.setFirstResult(start);
			query.setMaxResults(limit);
			List<Cart> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public int totalAllOrder() {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM Cart WHERE buyDate IS NOT NULL");
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				System.out.println(ex.toString());
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	@RequestMapping(value = "admin/order/{page}", method = RequestMethod.GET)
	public String orderConfig(ModelMap model, @PathVariable Integer page) {
		adminBaseURL = "admin/order";

		pNum = page;

		int productCountPerPage = 6;

		model.addAttribute("adminBaseURL", adminBaseURL);

		model.addAttribute("listOrder", getListNavAllOrder((page - 1) * productCountPerPage, productCountPerPage));
		model.addAttribute("totalPage",
				(totalAllOrder() % productCountPerPage == 0) ? totalAllOrder() / productCountPerPage
						: totalAllOrder() / productCountPerPage + 1);
		model.addAttribute("currentPage", page);

		return "admin/order/index";
	}

	List<CartItem> listOrderItem;
	Integer orderId;

	public CartItem checkExistOrderItem(Integer proId) {
		for (CartItem ci : listOrderItem) {
			if (ci.getProduct().getId() == proId) {
				return ci;
			}
		}
		return null;
	}

	@RequestMapping(value = "admin/order/insert", method = RequestMethod.GET)
	public String insertOrder(ModelMap model) {
		// model.addAttribute("order", new Cart());

		adminBaseURL = "admin/order/insert";
		model.addAttribute("adminBaseURL", adminBaseURL);

		Session session = factory.getCurrentSession();
//		Cart order = (Cart) session.get(Cart.class, id);
//		orderId = order.getId();
		Cart order = getCart(adminLogin.getId());
		CartItem ci = new CartItem();
		ci.setCart(order);
		listOrderItem = new ArrayList<CartItem>();
		model.addAttribute("order", order);
		model.addAttribute("listOrderItem", listOrderItem);
		model.addAttribute("orderItem", ci);
//		System.out.println("test");
		return "admin/order/insert";
	}

	@RequestMapping(value = "admin/order/insert", method = RequestMethod.POST)
	public String insertOrder(ModelMap model, @ModelAttribute("order") Cart order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			if (listOrderItem.size() == 0) {
				model.addAttribute("msg", "Giỏ hàng trống!");
				CartItem ci = new CartItem();
				ci.setCart(order);
				model.addAttribute("listOrderItem", listOrderItem);
				model.addAttribute("orderItem", ci);
				model.addAttribute("adminBaseURL", adminBaseURL);
				return "admin/order/insert";
			}

			order.setBuyDate(new Date());
			session.update(order);

			for (CartItem ci : listOrderItem) {
				session.save(ci);
			}

			Cart cart = new Cart();
			cart.setUser(adminLogin);
			session.save(cart);

			t.commit();

			CartItem ci = new CartItem();
			ci.setCart(order);
			model.addAttribute("listOrderItem", listOrderItem);
			model.addAttribute("orderItem", ci);
			model.addAttribute("adminBaseURL", adminBaseURL);
			model.addAttribute("message", "Thêm thành công !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("msg", "Thêm thất bại !\n" + e.toString());
		} finally {
			session.close();
		}

		return "redirect:/admin/order/" + pNum + ".html";
	}

	@RequestMapping(value = "admin/order/insert/insertItem", method = RequestMethod.POST)
	public String insertOrderItem(ModelMap model, @ModelAttribute("orderItem") CartItem orderItem) {

		Session session = factory.getCurrentSession();

		Product pro = (Product) session.get(Product.class, orderItem.getProduct().getId());

		CartItem ci_temp = checkExistOrderItem(orderItem.getProduct().getId());
		if (ci_temp != null) {
			ci_temp.setQuantity(ci_temp.getQuantity() + orderItem.getQuantity());
			for (int i = 0; i < listOrderItem.size(); i++) {
				if (listOrderItem.get(i).getProduct().getId() == ci_temp.getProduct().getId()) {
					orderItem.setProduct(pro);
					listOrderItem.set(i, ci_temp);
				}
			}
		} else {
			orderItem.setProduct(pro);
			listOrderItem.add(orderItem);
		}

		Cart order = getCart(adminLogin.getId());
		CartItem ci = new CartItem();
		ci.setCart(order);
		model.addAttribute("order", order);
		model.addAttribute("listOrderItem", listOrderItem);
		model.addAttribute("orderItem", ci);
		model.addAttribute("adminBaseURL", adminBaseURL);

		return "admin/order/insert";
	}

	@RequestMapping(value = "admin/order/insert/deleteItem/{id}", method = RequestMethod.GET)
	public String insertOrderItem(ModelMap model, @PathVariable("id") Integer id) {

		Session session = factory.getCurrentSession();

		for (int i = 0; i < listOrderItem.size(); i++) {
			if (listOrderItem.get(i).getProduct().getId() == id) {
				listOrderItem.remove(i);
			}
		}
		Cart order = getCart(adminLogin.getId());
		CartItem ci = new CartItem();
		ci.setCart(order);
		model.addAttribute("order", order);
		model.addAttribute("listOrderItem", listOrderItem);
		model.addAttribute("orderItem", ci);
		model.addAttribute("adminBaseURL", adminBaseURL);

		return "admin/order/insert";
	}

	////
	@RequestMapping(value = "admin/order/edit/{id}", method = RequestMethod.GET)
	public String editOrder(ModelMap model, @PathVariable("id") Integer id) {
		adminBaseURL = "admin/order/edit";
		model.addAttribute("adminBaseURL", adminBaseURL);

		Session session = factory.getCurrentSession();
		Cart order = (Cart) session.get(Cart.class, id);
		orderId = order.getId();
		CartItem ci = new CartItem();
		ci.setCart(order);
		model.addAttribute("order", order);
		listOrderItem = getCartItems(id);
		model.addAttribute("listOrderItem", listOrderItem);
		model.addAttribute("orderItem", ci);
		return "admin/order/edit";
	}

	@RequestMapping(value = "admin/order/edit/{id}", method = RequestMethod.POST)
	public String editOrder(ModelMap model, @ModelAttribute("order") Cart order) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			if (listOrderItem.size() == 0) {
				model.addAttribute("msg", "Giỏ hàng trống!");
				CartItem ci = new CartItem();
				ci.setCart(order);
				model.addAttribute("listOrderItem", listOrderItem);
				model.addAttribute("orderItem", ci);
				model.addAttribute("adminBaseURL", adminBaseURL);
				return "admin/order/edit";
			}
			session.update(order);

			for (CartItem ci : getCartItems(orderId)) {
				session.delete(ci);
			}

			for (CartItem ci : listOrderItem) {
				session.save(ci);
			}
			t.commit();

			CartItem ci = new CartItem();
			ci.setCart(order);
			model.addAttribute("listOrderItem", listOrderItem);
			model.addAttribute("orderItem", ci);
			model.addAttribute("adminBaseURL", adminBaseURL);
			model.addAttribute("message", "Sửa thành công !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("msg", "Sửa thất bại !\n" + e.toString());
		} finally {
			session.close();
		}

		return "admin/order/edit";
	}

	@RequestMapping(value = "admin/order/edit/insertItem", method = RequestMethod.POST)
	public String editOrderItem(ModelMap model, @ModelAttribute("orderItem") CartItem orderItem) {

		Session session = factory.getCurrentSession();

		Product pro = (Product) session.get(Product.class, orderItem.getProduct().getId());

		CartItem ci_temp = checkExistOrderItem(orderItem.getProduct().getId());
		if (ci_temp != null) {
			ci_temp.setQuantity(ci_temp.getQuantity() + orderItem.getQuantity());
			for (int i = 0; i < listOrderItem.size(); i++) {
				if (listOrderItem.get(i).getProduct().getId() == ci_temp.getProduct().getId()) {
					orderItem.setProduct(pro);
					listOrderItem.set(i, ci_temp);
				}
			}
		} else {
			orderItem.setProduct(pro);
			listOrderItem.add(orderItem);
		}

		Cart order = (Cart) session.get(Cart.class, orderId);
		CartItem ci = new CartItem();
		ci.setCart(order);
		model.addAttribute("order", order);
		model.addAttribute("listOrderItem", listOrderItem);
		model.addAttribute("orderItem", ci);
		model.addAttribute("adminBaseURL", adminBaseURL);

		return "admin/order/edit";
	}

	@RequestMapping(value = "admin/order/edit/deleteItem/{id}", method = RequestMethod.GET)
	public String editOrderItem(ModelMap model, @PathVariable("id") Integer id) {

		Session session = factory.getCurrentSession();

		for (int i = 0; i < listOrderItem.size(); i++) {
			if (listOrderItem.get(i).getProduct().getId() == id) {
				listOrderItem.remove(i);
			}
		}
		Cart order = (Cart) session.get(Cart.class, orderId);
		CartItem ci = new CartItem();
		ci.setCart(order);
		model.addAttribute("order", order);
		model.addAttribute("listOrderItem", listOrderItem);
		model.addAttribute("orderItem", ci);
		model.addAttribute("adminBaseURL", adminBaseURL);

		return "admin/order/edit";
	}

	@RequestMapping(value = "admin/order/{action}/{id}", method = RequestMethod.GET)
	public String submitOrder(ModelMap model, @PathVariable("action") String action, @PathVariable("id") Integer id) {

		Session session = factory.openSession();
		Cart order = (Cart) session.get(Cart.class, id);
		Transaction t = session.beginTransaction();
		try {
			if (action.equals("submit")) {
				order.setStatus(1);
			}
			if (action.equals("cancel")) {
				order.setStatus(3);
			}
			if (action.equals("delivered")) {
				order.setStatus(2);
			}
			session.update(order);
			t.commit();

		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "redirect:/admin/order/" + pNum + ".html";
	}

	@RequestMapping("admin/test")
	public String test() {
		return "admin_1/index";
	}
}