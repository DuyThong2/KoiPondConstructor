package com.example.SWPKoiContructor;



import com.example.SWPKoiContructor.SwpKoiContructorApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SwpKoiContructorApplication.class);
	}

}
