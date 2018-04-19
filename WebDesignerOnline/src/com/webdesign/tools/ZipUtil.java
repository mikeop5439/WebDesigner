package com.webdesign.tools;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;

import java.io.File;

public class ZipUtil {
    private static final Project DEFAULT_PROJECT = new Project();

    public  void unZip(File orgin, File dest) {
        Expand expand = new Expand();
        expand.setProject(DEFAULT_PROJECT);
        /*File orgin = new File("C:\\Users\\Zizizi\\Desktop\\新建文件夹\\TEST.zip");
        File dest = new File("C:\\Users\\Zizizi\\Desktop\\新建文件夹\\");*/
        expand.setSrc(orgin);
        expand.setDest(dest);
        expand.execute();
    }

    public static void zip(File orgin, File dest) {
        Zip zip = new Zip();
        zip.setProject(DEFAULT_PROJECT);
        zip.setDestFile(dest);

        FileSet fs = new FileSet();
        fs.setProject(DEFAULT_PROJECT);
        fs.setDir(orgin);
//      fs.setIncludes("**/*.java");
//      fs.setExcludes("**/*.xml");

        zip.addFileset(fs);
        zip.execute();
    }
}
