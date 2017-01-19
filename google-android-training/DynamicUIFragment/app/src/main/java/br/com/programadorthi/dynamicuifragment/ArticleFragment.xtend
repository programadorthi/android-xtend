package br.com.programadorthi.dynamicuifragment

import android.support.v4.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView

class ArticleFragment extends Fragment {

    public static val ARG_POSITION = "position"
    var mCurrentPosition = -1

    override View onCreateView(LayoutInflater inflater, ViewGroup container,
                                Bundle savedInstanceState) {

        // If activity recreated (such as from screen rotate), restore
        // the previous article selection set by onSaveInstanceState().
        // This is primarily necessary when in the two-pane layout.
        if (savedInstanceState != null) {
            mCurrentPosition = savedInstanceState.getInt(ARG_POSITION)
        }

        // Inflate the layout for this fragment
        inflater.inflate(R.layout.article_view, container, false)
    }

    override onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState)

        // Save the current article selection in case we need to recreate the fragment
        outState.putInt(ARG_POSITION, mCurrentPosition)
    }

    override void onStart() {
        super.onStart

        // During startup, check if there are arguments passed to the fragment.
        // onStart is a good place to do this because the layout has already been
        // applied to the fragment at this point so we can safely call the method
        // below that sets the article text.
        if (arguments != null) {
            // Set article based on argument passed in
            arguments.getInt(ARG_POSITION).updateArticleView
        } else if (mCurrentPosition != -1) {
            // Set article based on saved instance state defined during onCreateView
            mCurrentPosition.updateArticleView
        }
    }

    def updateArticleView(int position) {
        val article = activity.findViewById(R.id.article) as TextView
        article.text = Ipsum::Articles.get(position)
        mCurrentPosition = position
    }
}