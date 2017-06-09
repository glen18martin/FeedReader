package com.example.mypc.feedreader;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by MYPC on 09-06-2017.
 */

public class SavedFeedsActivity extends AppCompatActivity {

    private String TAG = SavedFeedsActivity.class.getSimpleName();

    private ProgressDialog pDialog;
    private ListView lv;

    // URL to get contacts JSON
    private static String url = "http://192.168.0.105:3000/api/feeds/";

    ArrayList<HashMap<String, String>> feedList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activtiy_savedfeeds);

        feedList = new ArrayList<>();

        lv = (ListView) findViewById(R.id.list);

        new GetFeeds().execute();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu, menu);
        menu.findItem(R.id.action_savedfeeds).setVisible(false);
        return true;
    }

    // handle button activities
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.action_fetchfeeds:
                Intent fetchFeeds =new Intent(SavedFeedsActivity.this,MainActivity.class);
                startActivity(fetchFeeds);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    /**
     * Async task class to get json by making HTTP call
     */
    private class GetFeeds extends AsyncTask<Void, Void, Void> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            // Showing progress dialog
            pDialog = new ProgressDialog(SavedFeedsActivity.this);
            pDialog.setMessage("Please wait...");
            pDialog.setCancelable(false);
            pDialog.show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {
            HttpHandler sh = new HttpHandler();

            // Making a request to url and getting response
            String jsonStr = sh.makeServiceCall(url);

            Log.e(TAG, "Response from url: " + jsonStr);

            if (jsonStr != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStr);

                    // Getting JSON Array node
                    JSONArray feeds = jsonObj.getJSONArray("data");

                    // looping through All Feeds
                    for (int i = 0; i < feeds.length(); i++) {
                        JSONObject f = feeds.getJSONObject(i);

                        String id = f.getString("id");
                        String title = f.getString("feed_title");
                        String description = f.getString("feed_description");
                        String link = f.getString("feed_link");

                        // tmp hash map for single feed
                        HashMap<String, String> feed = new HashMap<>();

                        // adding each child node to HashMap key => value
                        feed.put("id", id);
                        feed.put("title", title);
                        feed.put("description", description);
                        feed.put("link", link);

                        // adding feed to feed list
                        feedList.add(feed);
                    }
                } catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG)
                                    .show();
                        }
                    });

                }
            } else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                                "Couldn't get json from server. Check LogCat for possible errors!",
                                Toast.LENGTH_LONG)
                                .show();
                    }
                });

            }

            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            // Dismiss the progress dialog
            if (pDialog.isShowing())
                pDialog.dismiss();
            /**
             * Updating parsed JSON data into ListView
             * */
            ListAdapter adapter = new SimpleAdapter(
                    SavedFeedsActivity.this, feedList,
                    R.layout.list_item, new String[]{"title", "description",
                    "link"}, new int[]{R.id.title,
                    R.id.description, R.id.link});

            lv.setAdapter(adapter);
        }

    }
}