package com.webdesign.tools;
import com.webdesign.bean.recommend.UseRecommend;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.file.*;
import org.apache.mahout.cf.taste.impl.neighborhood.*;
import org.apache.mahout.cf.taste.impl.recommender.*;
import org.apache.mahout.cf.taste.impl.similarity.*;
import org.apache.mahout.cf.taste.model.*;
import org.apache.mahout.cf.taste.recommender.*;
import org.apache.mahout.cf.taste.similarity.*;

import java.io.*;
import java.util.*;

public class UserBased {
    final static int NEIGHBORHOOD_NUM = 2;
    final static int RECOMMENDER_NUM = 3;

    public List<UseRecommend> userBase(String pathCsv) throws IOException, TasteException {
        DataModel model = new FileDataModel(new File(pathCsv));
        UserSimilarity user = new EuclideanDistanceSimilarity(model);
        NearestNUserNeighborhood neighbor = new NearestNUserNeighborhood(NEIGHBORHOOD_NUM, user, model);
        Recommender r = new GenericUserBasedRecommender(model, neighbor, user);
        LongPrimitiveIterator iter = model.getUserIDs();
        List<UseRecommend> useRecommends=new ArrayList<UseRecommend>() ;

        while (iter.hasNext()) {
            long uid =  iter.nextLong();
            List<RecommendedItem> list = r.recommend(uid, RECOMMENDER_NUM);
            for (RecommendedItem ritem : list) {
                UseRecommend useRecommend=new UseRecommend();
                useRecommend.setUser_id(uid);
                useRecommend.setProd_id( ritem.getItemID());
                useRecommend.setValue(ritem.getValue());
                useRecommends.add(useRecommend);
            }
        }
        return useRecommends;
    }
}
