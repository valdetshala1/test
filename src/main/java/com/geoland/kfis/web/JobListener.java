package com.geoland.kfis.web;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.ee.servlet.QuartzInitializerListener;
import org.quartz.impl.StdSchedulerFactory;

import com.geoland.kfis.web.action.jobschedul.TrackingImportDataJob;

// TODO: Auto-generated Javadoc
/**
 * The listener interface for receiving job events.
 * The class that is interested in processing a job
 * event implements this interface, and the object created
 * with that class is registered with a component using the
 * component's <code>addJobListener<code> method. When
 * the job event occurs, that object's appropriate
 * method is invoked.
 *
 * @see JobEvent
 */
@WebListener
public class JobListener extends QuartzInitializerListener {

    /* (non-Javadoc)
     * @see org.quartz.ee.servlet.QuartzInitializerListener#contextInitialized(javax.servlet.ServletContextEvent)
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        super.contextInitialized(sce);
        /*
        ServletContext ctx = sce.getServletContext();
        StdSchedulerFactory factory = (StdSchedulerFactory) ctx.getAttribute(QUARTZ_FACTORY_KEY);
        try {
            Scheduler scheduler = factory.getScheduler();
            
            JobDetail campaignJob = JobBuilder.newJob(TrackingImportDataJob.class).build();
            Trigger trigger1 = TriggerBuilder.newTrigger().withIdentity("simple").withSchedule(
                    CronScheduleBuilder.cronSchedule("0 0/5 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ? * * *")).startNow().build();
            scheduler.scheduleJob(campaignJob, trigger1);
            scheduler.start();
        } catch (Exception e) {
            ctx.log("There was an error scheduling the job.", e);
        }
        */
    }

}
