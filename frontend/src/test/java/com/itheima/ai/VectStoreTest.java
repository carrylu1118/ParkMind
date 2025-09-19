package com.itheima.ai;

import org.junit.jupiter.api.Test;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.document.Document;
import org.springframework.ai.vectorstore.SearchRequest;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.ai.vectorstore.filter.Filter;
import org.springframework.ai.vectorstore.filter.FilterExpressionBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@SpringBootTest
public class VectStoreTest {

    @Autowired
    VectorStore vstore;

    @Autowired
    ChatClient serviceChatClient;

    @Test
    public void test() {
        Document doc = new Document("""
                作息与安全：
                宿舍楼门禁时间为周日至周四 23:00，周五、周六及节假日 24:00。请合理安排时间，准时归寝，确保人身安全。
                严禁在宿舍内使用明火或违章电器，安全无小事，你我共守护。
                离开宿舍时，请务必锁好门窗，保管好个人贵重物品。
                """, Map.of("id", "1", "title", "作息与安全"));
        Document doc2 = Document.builder().text("""
                健康与心灵：
                校医院地址： 生活区三号楼一层，24小时值班电话：123-456。
                心理咨询中心： 学生活动中心A座501。当你感到压力、迷茫或焦虑时，这里是安全、专业的避风港。预约电话：789-123
                """).metadata("id", "2").metadata("title", "健康与心灵").build();
        Document doc3 = Document.builder().text("""
                社团与活动：
                学校有超过100个学生社团，涵盖学术、文艺、体育、公益等领域。鼓励你至少加入一个社团，这是拓展兴趣、结交挚友的绝佳机会。
                关注校园官网和公告栏，积极参与“迎新晚会”、“学术文化节”、“运动会”等活动，让你的大学生活丰富多彩！
                """).metadata("id", "3").metadata("title", "社团与活动").build();

        vstore.add(List.of(doc, doc2, doc3));
    }

    @Test
    public void test2() {
        vstore.similaritySearch(SearchRequest.builder().similarityThreshold(0.5).topK(1).query("我想加入社团有什么要求？").build()).stream().forEach(System.out::println);
    }

    @Test
    public void test3ds() {
        Filter.Expression filterExpression = new Filter.Expression(
                Filter.ExpressionType.EQ,
                new Filter.Key("title"),
                new Filter.Value("作息与安全")
        );
        vstore.delete(filterExpression);

        //ID删除是可以的，注意这里参数不需要带前缀
        //所以，在生成时，要把id存下来
        vstore.delete(List.of("266ed706-9365-44d9-88c8-a58823e281e7"));
    }


    @Test
    public void testDeleteByMetadata() {
        deleteByMetadata("title", "作息与安全");
    }

    @Test
    public void searchByMetadata() {
        FilterExpressionBuilder b = new FilterExpressionBuilder();
        // 1. 构建查询请求：使用metadata过滤表达式
        SearchRequest searchRequest = SearchRequest.builder()
                .filterExpression(
                        b.eq("title", "作息与安全").build()
                )
                .build();

        // 2. 执行相似性搜索（实际上是为了利用过滤功能查找符合条件的文档）
        List<Document> matchingDocuments = vstore.similaritySearch(searchRequest);
        matchingDocuments.forEach(System.out::println);
    }


    /**
     * 根据metadata中的键值对删除向量
     *
     * @param metadataKey   metadata的键
     * @param metadataValue metadata的值
     * @return 删除的文档数量
     */
    public int deleteByMetadata(String metadataKey, Object metadataValue) {
        FilterExpressionBuilder b = new FilterExpressionBuilder();
        // 1. 构建查询请求：使用metadata过滤表达式
        SearchRequest searchRequest = SearchRequest.builder()
                .filterExpression(metadataKey + ":'" + metadataValue.toString() + "'") // 注意字符串值的引号
//                .filterExpression(metadataKey + " EQ '" + metadataValue.toString() + "'") // 注意字符串值的引号
                .build();

        // 2. 执行相似性搜索（实际上是为了利用过滤功能查找符合条件的文档）
        List<Document> matchingDocuments = vstore.similaritySearch(searchRequest);

        // 3. 提取找到的文档的ID
        List<String> idsToDelete = matchingDocuments.stream()
                .map(Document::getId)
                .collect(Collectors.toList());

        // 4. 根据找到的ID列表执行删除操作
        if (!idsToDelete.isEmpty()) {
//                vstore.delete(idsToDelete);
        }

        return idsToDelete.size();
    }


}
