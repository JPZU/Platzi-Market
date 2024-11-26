package com.platzi.market.web.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.Contact;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Platzi Market API")
                        .version("1.0")
                        .description("API para la gestión de compras y productos del mercado")
                        .contact(new Contact()
                                .name("Equipo Platzi Market")
                                .email("soporte@platzi.market")));
    }
}
