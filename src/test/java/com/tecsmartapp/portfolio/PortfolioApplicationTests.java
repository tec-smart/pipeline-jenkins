package com.tecsmartapp.portfolio;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.Connection;
import javax.sql.DataSource;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles("test")
class PortfolioApplicationTests {

    @Autowired
    private DataSource dataSource;

    @Test
    @DisplayName("Should load Spring context and connect to PostgreSQL")
    void shouldLoadContextAndConnectToDatabase() throws Exception {
        assertNotNull(dataSource, "DataSource should be created");
        try (Connection connection = dataSource.getConnection()) {
            assertNotNull(connection, "Connection should not be null");
            assertTrue(connection.isValid(2), "Connection should be valid");
        }
    }
}
