package junit.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.seyong.tx.beans.BookStore;
import com.seyong.tx.service.BookService;
import com.seyong.tx.service.impl.BookServiceImpl;

public class SpringTx {

	ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
	JdbcTemplate template = ioc.getBean(JdbcTemplate.class);
	NamedParameterJdbcTemplate jdbcTemplate = ioc.getBean(NamedParameterJdbcTemplate.class);

	
	@Test
	public void txTest01() {
		
		BookService bean = (BookService) ioc.getBean("bookServiceImpl");
		bean.checkOut(1, "JAVA");
	}
	
	
	/*具名参数练习*/
	@Test
	public void namedTest() {
		String sql = "INSERT INTO account(balance) VALUE (:balance)";
		
		int update = jdbcTemplate.update(sql, new BeanPropertySqlParameterSource(new BookStore(null, 9000.00)));
		System.out.println(update);
		
		/*Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("balance", 9000.00);
		int update = jdbcTemplate.update(sql, paramMap);
		System.out.println(update);*/
		
	}

	@Test
	public void queryTest() {
		String sql = "SELECT accountid accountID , balance FROM account WHERE accountid = ? ";
		BookStore bookStore = template.queryForObject(sql, new BeanPropertyRowMapper<>(BookStore.class), 1);
		System.out.println(bookStore);
	}

	@Test
	public void txTest() {
		String sql = "SELECT * FROM employees";
		List<Map<String, Object>> list = template.queryForList(sql);
		for (Map<String, Object> map : list) {
			System.out.println(map);
		}
	}

	@Test
	public void test() throws SQLException {

		DataSource bean = ioc.getBean(DataSource.class);
		Connection connection = bean.getConnection();
		System.out.println(connection);
	}

}
