package br.com.programadorthi.dynamicuifragment

import android.app.Activity
import android.os.Build
import android.os.Bundle
import android.support.v4.app.ListFragment
import android.view.View
import android.widget.ArrayAdapter
import android.widget.ListView

class HeadlinesFragment extends ListFragment {

    OnHeadlineSelectedListener mCallback

    // The container Activity must implement this interface so the frag can deliver messages
    interface OnHeadlineSelectedListener {
        /** Called by HeadlinesFragment when a list item is selected */
        def void onArticleSelected(int position)
    }

    override onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState)

        // We need to use a different list item layout for devices older than Honeycomb
        val layout = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
            android.R.layout.simple_list_item_activated_1 else android.R.layout.simple_list_item_1

        // Create an array adapter for the list view, using the Ipsum headlines array
        listAdapter = new ArrayAdapter<String>(activity, layout, Ipsum::Headlines)
    }

    override onStart() {
        super.onStart

        // When in two-pane layout, set the listview to highlight the selected list item
        // (We do this during onStart because at the point the listview is available.)
        if (fragmentManager.findFragmentById(R.id.article_fragment) != null) {
            listView.choiceMode = ListView.CHOICE_MODE_SINGLE
        }
    }

    override onAttach(Activity activity) {
        super.onAttach(activity)

        // This makes sure that the container activity has implemented
        // the callback interface. If not, it throws an exception.
        try {
            mCallback = activity as OnHeadlineSelectedListener
        } catch (ClassCastException e) {
            throw new ClassCastException(activity.toString
                + " must implement OnHeadlineSelectedListener")
        }
    }

    override onListItemClick(ListView l, View v, int position, long id) {
        // Notify the parent activity of selected item
        mCallback.onArticleSelected(position)

        // Set the item as checked to be highlighted when in two-pane layout
        listView.setItemChecked(position, true)
    }
}