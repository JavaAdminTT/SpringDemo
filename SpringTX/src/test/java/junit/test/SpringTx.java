package junit.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class SpringTx {

	ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
	JdbcTemplate template = ioc.getBean(JdbcTemplate.class);
	
	@Test
	public void txTest() {
		String sql = "SELECT * FROM employees";
		List<Map<String,Object>> list = template.queryForList(sql);
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
