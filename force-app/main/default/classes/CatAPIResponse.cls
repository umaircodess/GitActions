public class CatAPIResponse {
    public Integer current_page;
    public List<BreedData> data;
    public String first_page_url;
   @JsonProperty('from')
    public Integer from_z;
    public Integer last_page;
    public String last_page_url;
    public List<Link> links;
    public String next_page_url;
    public String path;
    public String per_page;
    public String prev_page_url;
    public Integer to;
    public Integer total;

public class BreedData {
    public String breed;
    public String country;
    public String origin;
    public String coat;
    public String pattern;
}

public class Link {
    public String url;
    public String label;
    public Boolean active;
}

    public static CatAPIResponse parse(String json) {
        return (CatAPIResponse) System.JSON.deserialize(json, CatAPIResponse.class);
    }

}