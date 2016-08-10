package ru.hokan;

import org.apache.hive.service.cli.HiveSQLException;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.results.format.ResultFormatType;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;
import org.openjdk.jmh.runner.options.TimeValue;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.*;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.logging.*;
import java.util.logging.Level;

@State(Scope.Benchmark)
public class JMHQueriesTest {
    private static final Logger LOGGER = Logger.getLogger(JMHQueriesTest.class.getName());

    private static final String DRIVER_NAME = "org.apache.hive.jdbc.HiveDriver";
    private static final String HIVE_JDBC_CONNECTION_URI = "jdbc:hive2://localhost:10000/homework1";
    private static final String USER_NAME = "hive";
    private static final String PASSWORD = "hive";

    private static final int NUMBER_OF_ITERATIONS = 20;
    private static final int NUMBER_OF_FORKS = 1;
    private static final String RESULT_FILE_NAME = "result.csv";
    private static final int SECONDS_TIMEOUT = 10;
    private static final int NUMBER_WARMUP_OPERATIONS = 1;

    private static final String QUERY_DIRECTORY = "jmh";
    private static final String QUERY_1_FILE_NAME = "query1.sql";
    private static final String QUERY_2_FILE_NAME = "query2.sql";
    private static final String QUERY_3_FILE_NAME = "query3.sql";
    private static final String QUERY_4_FILE_NAME = "query4.sql";

    private List<String> queryMapFilesNameList = new ArrayList<String>() {{
        add(QUERY_1_FILE_NAME);
        add(QUERY_2_FILE_NAME);
        add(QUERY_3_FILE_NAME);
        add(QUERY_4_FILE_NAME);
    }};

    private Map<String, String> queryMap = new HashMap<>();

    private Connection connection;

    @Setup
    public void setUp() throws SQLException {
        createQueryMap();

        try {
            Class.forName(DRIVER_NAME);
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            return;
        }

        connection = DriverManager.getConnection(HIVE_JDBC_CONNECTION_URI, USER_NAME, PASSWORD);
    }

    private void createQueryMap() {
        for (String s : queryMapFilesNameList) {
            String fileName = QUERY_DIRECTORY + File.separator + s;
            String fileContent = getQueryFileContent(fileName);
            queryMap.put(s, fileContent);
        }
    }

    private String getQueryFileContent(String fileName) {
        StringBuilder builder = new StringBuilder();

        ClassLoader classLoader = getClass().getClassLoader();
        File file;
        try {
            file = new File(classLoader.getResource(fileName).toURI());
        } catch (URISyntaxException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            return null;
        }

        try (Scanner scanner = new Scanner(file)) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                builder.append(line).append("\n");
            }
            scanner.close();
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            return null;
        }

        return builder.toString();

    }

    @TearDown
    public void tearDown() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }

    @Benchmark
    public ResultSet executeQuery1() throws SQLException {
        try (Statement statement = connection.createStatement()) {
            return statement.executeQuery(queryMap.get(QUERY_1_FILE_NAME));
        }
    }

    @Benchmark
    public ResultSet executeQuery2() throws SQLException {
        try (Statement statement = connection.createStatement()) {
            return statement.executeQuery(queryMap.get(QUERY_2_FILE_NAME));
        }
    }

    @Benchmark
    public ResultSet executeQuery3() throws SQLException {
        try (Statement statement = connection.createStatement()) {
            return statement.executeQuery(queryMap.get(QUERY_3_FILE_NAME));
        }
    }

    @Benchmark
    public ResultSet executeQuery4() throws SQLException {
        try (Statement statement = connection.createStatement()) {
            return statement.executeQuery(queryMap.get(QUERY_4_FILE_NAME));
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(".*" + JMHQueriesTest.class.getSimpleName() + ".*")
                .forks(NUMBER_OF_FORKS)
                .jvmArgs()
                .measurementIterations(NUMBER_OF_ITERATIONS)
                .mode(Mode.AverageTime)
                .result(RESULT_FILE_NAME)
                .resultFormat(ResultFormatType.TEXT)
                .shouldFailOnError(true)
                .timeout(TimeValue.seconds(SECONDS_TIMEOUT))
                .timeUnit(TimeUnit.SECONDS)
                .warmupIterations(NUMBER_WARMUP_OPERATIONS)
                .build();
        new Runner(opt).run();
    }
}